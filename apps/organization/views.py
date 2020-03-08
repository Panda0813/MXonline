from django.db.models import Q
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse

from .models import CourseOrg, CityDict, Teacher
from .forms import UserAskForm
from operation.models import UserFavorite
from courses.models import Course
# Create your views here.

class OrgView(View):
    '''
    课程机构列表
    '''
    def get(self, request):
        #所有机构
        all_orgs = CourseOrg.objects.all()
        # 热门机构
        hot_orgs = all_orgs.order_by('-click_nums')[:3]
        #所有城市
        all_citys = CityDict.objects.all()

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # contains类似sql中的like,前面加i表示不区分大小写
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords) |
                                             Q(desc__icontains=search_keywords))

        # 取出筛选城市id
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 类别筛选
        category = request.GET.get('ct', '')
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-courses_nums')

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs, per_page=5, request=request)

        orgs = p.page(page)
        org_nums = all_orgs.count()
        return render(request, 'org-list.html', {
            'all_orgs': orgs,
            'all_citys':all_citys,
            'org_nums':org_nums,
            'city_id': city_id,
            'category':category,
            'hot_orgs':hot_orgs,
            'sort':sort,
        })

class AddUserAskView(View):
    '''
    添加用户咨询信息
    '''
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            # ModelForm的处理
            user_ask = userask_form.save(commit=True)  # 直接提交到数据库
            return HttpResponse('{"status": "success", "msg": "添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加出错"}',
                                content_type='application/json')

class OrgHomeView(View):
    '''
    机构首页
    '''
    def get(self, request, org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断用户是否收藏该机构
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        # 通过主表获取副表的值
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html',{
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
        })


class OrgCourseView(View):
    '''
    机构课程
    '''
    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断用户是否收藏该机构
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        # 通过主表获取副表的值
        all_courses = course_org.course_set.all()
        return render(request, 'org-detail-course.html',{
            'all_courses':all_courses,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
        })


class OrgDescView(View):
    '''
    机构介绍
    '''
    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断用户是否收藏该机构
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        # 通过主表获取副表的值
        return render(request, 'org-detail-desc.html',{
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
        })


class OrgTeacherView(View):
    '''
    机构讲师
    '''
    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断用户是否收藏该机构
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        # 通过主表获取副表的值
        all_teachers = course_org.teacher_set.all()
        return render(request, 'org-detail-teachers.html',{
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
        })


class AddFavView(View):
    '''
    用户收藏/取消收藏
    '''
    def post(self, request):
        fav_id = int(request.POST.get('fav_id', 0))
        fav_type = int(request.POST.get('fav_type', 0))

        # 首先用户要登录
        if not request.user.is_authenticated:  # 判断用户是否登录
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}',
                                content_type='application/json')

        exist_record = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)
        if exist_record:
            # 记录已经存在，则表示用户要取消收藏
            exist_record.delete()
            return HttpResponse('{"status": "success", "msg": "收藏"}',
                                content_type='application/json')

        else:
            user_fav = UserFavorite()
            if fav_id > 0 and fav_type > 0:
                user_fav.user = request.user
                user_fav.fav_id = fav_id
                user_fav.fav_type = fav_type
                user_fav.save()
                return HttpResponse('{"status": "success", "msg": "已收藏"}',
                                    content_type='application/json')

            else:
                return HttpResponse('{"status": "fail", "msg": "收藏出错"}',
                                    content_type='application/json')


class TeacherListView(View):
    '''
    课程讲师列表页
    '''
    def get(self, request):
        all_teachers = Teacher.objects.all()

        # 课程讲师搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # contains类似sql中的like,前面加i表示不区分大小写
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) |
                                             Q(work_company__icontains=search_keywords) |
                                             Q(work_position__icontains=search_keywords))

        # 讲师人气排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        # 讲师排行榜
        sorted_teacher = Teacher.objects.all().order_by('-click_nums')[:3]

        # 对讲师进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teachers, per_page=1, request=request)

        teachers = p.page(page)

        teacher_nums = all_teachers.count()
        return render(request, 'teachers-list.html', {
            'all_teachers':teachers,
            'sorted_teacher':sorted_teacher,
            'teacher_nums':teacher_nums,
        })

class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        all_courses = Course.objects.filter(teacher=teacher)

        # 是否收藏
        has_fav_teacher = False
        has_fav_org = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                has_fav_teacher = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.org.id, fav_type=2):
                has_fav_org = True

        # 讲师排行榜
        sorted_teacher = Teacher.objects.all().order_by('-click_nums')[:3]

        return render(request, 'teacher-detail.html', {
            'teacher':teacher,
            'all_courses':all_courses,
            'sorted_teacher':sorted_teacher,
            'has_fav_teacher':has_fav_teacher,
            'has_fav_org':has_fav_org
        })
