from django.db import models
from apps.doctor.models import Doctor
# Create your models here.


class Schedule(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    day = models.DateField(blank=False, null=False)
    schedules = models.TimeField(blank=False, null=False)
