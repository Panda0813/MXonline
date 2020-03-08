# coding:utf-8
from django.conf.urls import url
from django.urls import path, include

from .views import CourseListView, CourseDetailView, CourseInfoView, CommentView, AddCommentView

app_name = 'course'

urlpatterns = [
    #课程列表
    url(r'^list/$',CourseListView.as_view(), name='course_list'),

    # 课程详情页
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(), name='detail'),
    # 课程信息
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='info'),
    # 查看课程评论
    url(r'^comment/(?P<course_id>\d+)/$', CommentView.as_view(), name='comment'),
    # 添加课程评论
    url(r'^add_comment/$', AddCommentView.as_view(), name='add_comment'),

]

