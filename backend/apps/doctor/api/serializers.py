from rest_framework.serializers import ModelSerializer
from apps.doctor.models import Doctor
from apps.specialty.api.serializers import SpecialtySerializer


class DoctorSerializer(ModelSerializer):
    specialty = SpecialtySerializer()

    class Meta:
        model = Doctor
        fields = ['id', 'name', 'crm', 'email', 'phone', 'specialty']
