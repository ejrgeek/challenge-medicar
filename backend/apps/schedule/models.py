from django.core.exceptions import ValidationError
from django.db import models
from apps.doctor.models import Doctor
from datetime import datetime
# Create your models here.


class Schedule(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    day = models.DateField()
    schedules = models.TimeField()

    class Meta:
        unique_together = ("doctor", "day", "schedules")

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):

        if self.day == datetime.now().date() and self.schedules >= datetime.now().time() \
                or self.day > datetime.now().date():
            return super().save()
        else:
            raise ValidationError("VOCÊ PRECISA INSERIR DATA E/OU HORÁRIO VÁLIDO")

    def __str__(self):
        return f'{self.doctor}, no dia: {self.day.strftime("%d/%m/%Y")} às {self.schedules.strftime("%H:%M")}'
