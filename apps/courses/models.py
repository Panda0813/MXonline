from django.db import models

from organization.models import CourseOrg, Teacher
# Create your models here.


class Course(models.Model):
    courseorg = models.ForeignKey(CourseOrg, verbose_name='课程机构', null=True, blank=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=50, verbose_name='课程名')
    is_banner = models.BooleanField(default=False, verbose_name='是否轮播')
    desc = models.CharField(max_length=300, verbose_name='课程描述')
    detail = models.TextField(verbose_name='课程详情')
    degree = models.CharField(choices=(('cj','初级'),('zj','中级'),('gj','高级')),max_length=2,verbose_name='课程难度')
    teacher = models.ForeignKey(Teacher, verbose_name='课程讲师',null=True ,blank=True,on_delete=models.SET_NULL)
    learn_time = models.IntegerField(default=0, verbose_name='学习时长(分钟数)')
    student = models.IntegerField(default=0, verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(max_length=100, upload_to='courses/%Y/%m', verbose_name='封面图')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    category = models.CharField(max_length=20, default='后端开发', verbose_name='课程类别')
    tag = models.CharField(max_length=10, default='', verbose_name='课程标签')
    youneed_know = models.CharField(max_length=300, default='', verbose_name='课程须知')
    teacher_tell = models.CharField(max_length=300, default='', verbose_name='')

    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    # 获取课程章节数
    def get_zj_nums(self):
        return self.lesson_set.all().count()

    get_zj_nums.short_description = '章节数'

    # 加入自定义html
    def go_to(self):
        from django.utils.safestring import mark_safe  # 将文本转为html代码
        return mark_safe("<a href='http://www.baidu.com>跳转</a>")

    go_to.short_description = '跳转'

    # 获取课程学习用户
    def get_learn_stus(self):
        return self.usercourse_set.all()[:5]

    # 获取课程所有章节
    def get_course_lesson(self):
        return self.lesson_set.all()

    def __str__(self):
        return self.name

class BannerCourse(Course):
    class Meta:
        verbose_name = '轮播课程'
        verbose_name_plural = verbose_name
        proxy = True  #不会再生成表


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='章节名')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    # 获取章节所有video
    def get_lesson_video(self):
        return self.video_set.all()

    def __str__(self):
        return self.name

class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name='章节', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='视频名')
    url = models.CharField(max_length=200, verbose_name='访问地址', default='')
    learn_time = models.IntegerField(default=0, verbose_name='学习时长(分钟数)')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='资源名')
    download = models.FileField(upload_to='course/%Y/%m', verbose_name='资源文件', max_length=100)
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name
