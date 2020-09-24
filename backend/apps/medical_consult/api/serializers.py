from rest_framework.serializers import ModelSerializer
from apps.medical_consult.models import MedicalConsult
from apps.doctor.api.serializers import DoctorSerializer


class MedicalConsultSerializer(ModelSerializer):

    doctor = DoctorSerializer()

    class Meta:
        model = MedicalConsult
        fields = ['day', 'time', 'scheduling_date', 'doctor', 'user']
