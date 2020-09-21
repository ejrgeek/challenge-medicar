from django.core.exceptions import ValidationError
from django.db import models
from apps.doctor.models import Doctor
from datetime import datetime
# Create your models here.


class Timetable(models.Model):
    time = models.TimeField(unique=True)

    def __str__(self):
        return f'{self.time.strftime("%H:%M")}'


class Schedule(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    day = models.DateField()
    schedules = models.ManyToManyField(Timetable)
    inserted_in = models.DateField(auto_now_add=True)

    class Meta:
        unique_together = ("doctor", "day")

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):

        if self.day >= datetime.now().date():
            return super().save()
        else:
            raise ValidationError("VOCÊ PRECISA INSERIR UMA DATA VÁLIDA")

    def __str__(self):
        return f'{self.doctor}, no dia {self.day.strftime("%d/%m/%Y")}'
