from rest_framework.fields import SerializerMethodField
from rest_framework.serializers import ModelSerializer
from apps.schedule.models import Schedule, Timetable
from apps.doctor.api.serializers import DoctorSerializer


class TimetableSerializer(ModelSerializer):
    class Meta:
        model = Timetable
        fields = ['time']


class ScheduleSerializer(ModelSerializer):
    doctor = DoctorSerializer()
    schedules = TimetableSerializer(many=True)

    class Meta:
        model = Schedule
        fields = ['id', 'doctor', 'day', 'schedules']
