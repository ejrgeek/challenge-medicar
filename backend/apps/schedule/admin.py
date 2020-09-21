from django.contrib import admin
from .models import Schedule, Timetable
# Register your models here.

admin.site.register(Timetable)
admin.site.register(Schedule)