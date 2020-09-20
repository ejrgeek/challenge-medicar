from django.db import models
from apps.specialty.models import Specialty


# Create your models here.


class Doctor(models.Model):
    name = models.CharField(max_length=150)
    crm = models.CharField(max_length=15)
    email = models.EmailField(blank=True, null=True)
    phone = models.CharField(max_length=11, blank=True, null=True)
    specialty = models.ForeignKey(Specialty, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name
