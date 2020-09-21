from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from .serializers import DoctorSerializer
from apps.doctor.models import Doctor
from rest_framework.permissions import IsAuthenticated


class DoctorViewSet(ModelViewSet):

    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        queryset = Doctor.objects.all()
        serializer = DoctorSerializer(queryset, many=True)
        return Response(serializer.data)
