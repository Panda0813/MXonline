from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import Course,CourseResource
from operation.models import UserFavorite, CourseComment, UserCourse
from utils.mixin_utils import LoginRequiredMixin
# Create your views here.

class CourseListView(View):
    def get(self, request):
        all_courses = Course.objects.all().order_by('-add_time')

        # 热门课程
        hot_courses = Course.objects.all().order_by('-click_nums')[:3]

        # 课程搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # contains类似sql中的like,前面加i表示不区分大小写
            all_courses = all_courses.filter(Q(name__icontains=search_keywords)|
                                             Q(desc__icontains=search_keywords)|
                                             Q(detail__icontains=search_keywords))

        # 课程排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_courses = all_courses.order_by('-student')
            elif sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')

        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, per_page=3, request=request)

        courses = p.page(page)

        return render(request, 'course-list.html', {
            'all_courses':courses,
            'sort':sort,
            'hot_courses':hot_courses,
        })

class CourseDetailView(View):
    '''
    课程详情页
    '''
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        # 增加课程点击数
        course.click_nums += 1
        course.save()

        # 是否收藏
        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.courseorg.id, fav_type=2):
                has_fav_org = True

        # 相关课程推荐
        tag = course.tag
        relate_courses = []
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:1]

        return render(request, 'course-detail.html', {
            'course':course,
            'relate_courses':relate_courses,
            'has_fav_course':has_fav_course,
            'has_fav_org':has_fav_org,
        })


class CourseInfoView(LoginRequiredMixin, View):
    '''
    章节学习信息
    '''
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        # 查询用户是否已经关联了该课程
        user_course = UserCourse.objects.filter(user=request.user, course=course)
        if not user_course:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        # 获取所有学过该课程的学员学过的其他所有课程
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_c.user.id for user_c in user_courses]
        # 得到这些用户的所有课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 根据课程id取到课程
        course_ids = [user_c.course.id for user_c in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]

        all_resources = CourseResource.objects.filter(course=course)

        return render(request, 'course-video.html', {
            'course': course,
            'all_resources':all_resources,
            'relate_courses':relate_courses,
        })

class CommentView(LoginRequiredMixin, View):
    '''
    评论
    '''
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComment.objects.filter(course=course).all()

        return render(request, 'course-comment.html', {
            'course': course,
            'all_resources':all_resources,
            'all_comments':all_comments,
        })

class AddCommentView(View):
    '''
    用户添加课程评论
    '''
    def post(self, request):
        if not request.user.is_authenticated:  # 判断用户是否登录
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}',
                                content_type='application/json')

        course_id = int(request.POST.get('course_id', 0))
        comments = request.POST.get('comments', '')
        if course_id > 0 and comments:
            course_comment = CourseComment()
            course = Course.objects.get(id=course_id)
            course_comment.user = request.user
            course_comment.course = course
            course_comment.comments = comments
            course_comment.save()
            return HttpResponse('{"status": "success", "msg": "添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加失败"}',
                                content_type='application/json')
