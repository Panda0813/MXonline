"""MXonline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.urls import path, include
import xadmin
from django.views.generic import TemplateView
from django.views.static import serve

from users.views import IndexView,LoginView, LogoutView,RegisterView, ActiveUserView, ForgetPwdView, ResetView, ModifyPwdView

from organization.views import OrgView
from MXonline.settings import MEDIA_ROOT
# from MXonline.settings import STATIC_ROOT

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),

    url('^$', IndexView.as_view(), name='index'),
    url('^login/$', LoginView.as_view(), name='login'),
    url('^logout/$', LogoutView.as_view(), name='logout'),
    url('^register/$', RegisterView.as_view(), name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>\w+)/$', ActiveUserView.as_view(), name='useractive'),
    url(r'^forget/$', ForgetPwdView.as_view(), name='forgetpwd'),
    url(r'^reset/(?P<reset_code>\w+)/$', ResetView.as_view(), name='resetpwd'),
    url(r'^modify/$', ModifyPwdView.as_view(), name='modifypwd'),

    # 课程机构url配置
    url(r'^org/', include('organization.urls', namespace='org')),

    # 课程相关
    url(r'^course/', include('courses.urls', namespace='course')),

    # 个人中心
    url(r'^users/', include('users.urls', namespace='users')),


    # 配置上传文件的访问处理
    url(r'^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    # 配置静态文件
    # url(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),

]


# 全局404页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'