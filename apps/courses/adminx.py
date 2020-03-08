# coding:utf-8
import xadmin
from .models import Course, Lesson, Video, BannerCourse, CourseResource

# 实现课程和章节可以同页面添加
class LessonInline(object):
    model = Lesson
    extra = 0

class CourseResourceInline(object):
    model = CourseResource
    extra = 0

class CourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'learn_time', 'student', 'fav_nums', 'click_nums','get_zj_nums','go_to']
    search_fields = ['name', 'desc']
    list_filter = ['degree', 'add_time']
    ordering = ['-click_nums']  # 排序
    readonly_fields = ['click_nums', 'fav_nums']  # 设置只读
    exclude = ['add_time']  # 设置不显示
    inlines = [LessonInline, CourseResourceInline]
    list_editable = ['degree', 'desc']  # 可以直接在列表页编辑的字段
    refresh_times = [3, 5]  # 3-5秒刷新一次

    def queryset(self):
        # 只取出轮播课程
        qs = Course.objects.filter(is_banner=False).all()
        return qs

class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'learn_time', 'student', 'fav_nums', 'click_nums']
    search_fields = ['name', 'desc']
    list_filter = ['degree', 'add_time']
    ordering = ['-click_nums']  # 排序
    readonly_fields = ['click_nums', 'fav_nums']  # 设置只读
    exclude = ['add_time']  # 设置不显示
    inlines = [LessonInline, CourseResourceInline]


    def queryset(self):
        # 只取出轮播课程
        qs = Course.objects.filter(is_banner=True)
        return qs

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']

class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)