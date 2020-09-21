from rest_framework.serializers import ModelSerializer
from apps.specialty.models import Specialty


class SpecialtySerializer(ModelSerializer):
    class Meta:
        model = Specialty
        fields = ['id', 'name']
