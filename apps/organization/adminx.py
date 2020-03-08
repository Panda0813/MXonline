# coding:utf-8
import xadmin
from .models import CityDict, CourseOrg, Teacher


class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'add_time']

class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'click_nums', 'fav_nums', 'city', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc','add_time']
    relfield_style = 'fk-ajax'

class TeacherAdmin(object):
    list_display = ['org', 'name', 'work_years', 'work_company', 'click_nums', 'fav_nums', 'add_time']
    search_fields = ['name']
    list_filter = ['org__name', 'name','work_company', 'add_time']

xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)


