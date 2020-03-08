# Generated by Django 2.0.7 on 2020-03-07 10:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_teacher_image'),
        ('courses', '0008_video_learn_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='teacher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='organization.Teacher', verbose_name='课程讲师'),
        ),
    ]
