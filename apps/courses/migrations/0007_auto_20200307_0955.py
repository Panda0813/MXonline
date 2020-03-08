# Generated by Django 2.0.7 on 2020-03-07 09:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0006_lesson_url'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='lesson',
            name='url',
        ),
        migrations.AddField(
            model_name='video',
            name='url',
            field=models.CharField(default='', max_length=200, verbose_name='访问地址'),
        ),
    ]
