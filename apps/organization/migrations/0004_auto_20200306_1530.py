# Generated by Django 2.0.7 on 2020-03-06 15:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0003_courseorg_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='courses_nums',
            field=models.IntegerField(default=0, verbose_name='课程数'),
        ),
        migrations.AddField(
            model_name='courseorg',
            name='students',
            field=models.IntegerField(default=0, verbose_name='学习人数'),
        ),
    ]
