# coding:utf-8
from users.models import EmailVerifyRecord
from random import Random
import random
from django.core.mail import send_mail

from MXonline.settings import EMAIL_FROM

# 生成随机字符串
def generate_random_str(rdlength=8):
    str = ''
    chars = 'JLIDLnsldasfDasAdewADIUOYOdsudsoHLIWDls'
    length = len(chars) - 1
    rd = Random()
    for i in range(rdlength):
        str += chars[random.randint(0, length)]
    return str


def send_register_emai(email, send_type="register"):
    email_record = EmailVerifyRecord()
    if send_type == 'update_email':
        random_str = generate_random_str(4)
    else:
        random_str = generate_random_str(16)
    email_record.code = random_str
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ''
    email_body = ''

    if send_type == 'register':
        email_title = '慕学在线网注册激活链接'
        email_body = '请点击下面的链接激活你的账户：http://127.0.0.1:8000/active/{}'.format(random_str)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email,])
        if send_status:
            pass

    elif send_type == 'forget':
        email_title = '慕学在线网密码重置链接'
        email_body = '请点击下面的链接重置密码：http://127.0.0.1:8000/reset/{}'.format(random_str)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email, ])
        if send_status:
            pass

    elif send_type == 'update_email':
        email_title = '慕学在线网邮箱修改链接'
        email_body = '你的邮箱验证码：{}'.format(random_str)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email, ])
        if send_status:
            pass



