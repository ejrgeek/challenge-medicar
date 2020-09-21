from django.db import models
from apps.doctor.models import Doctor
# Create your models here.


class MedicalConsult(models.Model):
    day = models.DateField()
    time = models.TimeField()
    scheduling_date = models.DateTimeField(auto_now_add=True)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
