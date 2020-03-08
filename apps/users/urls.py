# coding:utf-8
from django.conf.urls import url
from django.urls import path, include

from .views import UserInfoView, UploadImageaView, CenterModifyPwdView, SendEmailCodeView
from .views import UpdateEmailView, MyCourseView, MyFavOrgView, MyMessageView

app_name = 'users'

urlpatterns = [
    # 用户信息
    url(r'^info/$', UserInfoView.as_view(), name='userinfo'),
    # 用户头像上传
    url(r'^image/upload/$', UploadImageaView.as_view(), name='image_upload'),
    # 用户个人中心修改密码
    url(r'^update/pwd/$', CenterModifyPwdView.as_view(), name='update_pwd'),
    # 向邮箱发送验证码
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendemail_code'),
    # 修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),
    # 我的课程
    url(r'^mycourse/$', MyCourseView.as_view(), name='mycourse'),
    # 我收藏的机构
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),
    # 我的消息
    url(r'^mymessage/$', MyMessageView.as_view(), name='mymessage'),

]