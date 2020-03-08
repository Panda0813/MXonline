from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg
from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm, UploadImageForm
from .forms import UserInfoForm
from utils.email_send import send_register_emai
from utils.mixin_utils import LoginRequiredMixin
from courses.models import Course

# Create your views here.
class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form':register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = request.POST.get('email', '')
            if UserProfile.objects.filter(email=username):
                return render(request, 'register.html', {'msg': '该邮箱已被注册','register_form':register_form})
            password = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = username
            user_profile.email = username
            user_profile.password = make_password(password)
            user_profile.is_active = False
            user_profile.save()

            send_register_emai(username, 'register')

            # 写入欢迎注册消息
            user_msg = UserMessage()
            user_msg.user = UserProfile
            user_msg.message = '欢迎注册慕学在线网'
            user_msg.save()

            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form':register_form})

class ActiveUserView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
            return render(request, 'login.html')
        else:
            return render(request, 'active_fail.html')



class LoginView(View):
    def get(self, request):
        return render(request, 'login.html', {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)
            if user is not None:
                if not user.is_active:
                    return render(request, 'login.html', {'msg':'请先激活邮箱'})
                login(request, user)
                return redirect('/')
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'login_form':login_form})

class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('/')


class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {'forget_form':forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', '')
            send_register_emai(email, 'forget')

            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form})


class ResetView(View):
    def get(self, request, reset_code):
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html',{'email':email})
        else:
            return render(request, 'active_fail.html')

class ModifyPwdView(View):
    '''
    修改用户密码
    '''
    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html',{'email':email, 'msg':'密码不一致，请重新输入'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email':email, 'modify_form':modify_form})


class UserInfoView(LoginRequiredMixin, View):
    '''
    用户个人信息
    '''
    def get(self, request):
        return render(request, 'usercenter-info.html', {})

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse(user_info_form.errors)


class UploadImageaView(View):
    '''
    用户修改头像
    '''
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        # 使用modelForm直接保存上传的文件
        if image_form.is_valid():
            image_form.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'status': 'fail'})

class CenterModifyPwdView(View):
    '''
    个人中心修改用户密码
    '''
    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                return JsonResponse({'status': 'fail', 'msg':'密码不一致'})
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse(modify_form.errors)


class SendEmailCodeView(View):
    '''
    发送邮箱验证码
    '''
    def get(self, request):
        email = request.GET.get('email', '')
        if UserProfile.objects.filter(email=email):
            return JsonResponse({'email': '该邮箱已被注册'})
        # 向邮箱发送验证码
        send_register_emai(email, 'update_email')
        return JsonResponse({'status': 'success'})

class UpdateEmailView(View):
    '''
    修改邮箱
    '''
    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'email': '验证码错误'})


class MyCourseView(LoginRequiredMixin, View):
    '''
    我的课程
    '''
    def get(self, request):
        user_courses = UserCourse.objects.filter(user=request.user)

        return render(request, 'usercenter-mycourse.html', {
            'user_courses':user_courses,
        })

class MyFavOrgView(LoginRequiredMixin, View):
    '''
    我的课程
    '''
    def get(self, request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, 'usercenter-fav-org.html', {
            'org_list':org_list,
        })

class MyMessageView(LoginRequiredMixin, View):
    '''
    我的消息
    '''
    def get(self, request):
        all_messages = UserMessage.objects.filter(user=request.user.id)
        # 进入消息页时将未读变成已读
        all_unread_messages = UserMessage.objects.filter(user=request.user.id,has_read=False)
        for unread_msg in all_unread_messages:
            unread_msg.has_read = True
            unread_msg.save()

        # 对消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, per_page=3, request=request)

        messages = p.page(page)

        return render(request, 'usercenter-message.html', {
            'messages':messages
        })

class IndexView(View):
    def get(self, request):
        # 取出轮播图
        all_banners = Banner.objects.all().order_by('index')

        courses = Course.objects.filter(is_banner=False)[:5]
        banner_courses = Course.objects.filter(is_banner=True)[:3]

        course_orgs = CourseOrg.objects.all()[:15]
        return render(request, 'index.html', {
            'all_banners':all_banners,
            'courses':courses,
            'banner_courses':banner_courses,
            'course_orgs':course_orgs
        })

def page_not_found(request, **kwargs):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response

def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response

# 有SQL注入隐患的登录
class LoginUnSafeView(View):
    def get(self, request):
        return render(request, 'login.html', {})


    def post(self, request):
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')

        import pymysql
        conn = pymysql.connect(host='127.0.0.1',
                               port=3306,
                               user='root',
                               password='123456',
                               db='mxonline',
                               charset='utf8')
        cursor = conn.cursor()
        sql_select = "select * from users_userprofile where email='{0}' and password='{1}' ".format(username,password)

        result = cursor.execute(sql_select)
        for row in cursor.fetchall():
            # 查询到用户
            pass
