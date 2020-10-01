from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from apps.doctor.models import Doctor
from .serializers import DoctorSerializer


def return_query(param):
    if 'search' in param.keys() and 'especialidade' in param.keys():
        return Doctor.objects \
            .filter(name__icontains=param['search']) \
            .filter(specialty=param['especialidade'])
    elif 'search' in param.keys():
        return Doctor.objects.filter(name__icontains=param['search'])
    elif 'especialidade' in param.keys():
        return Doctor.objects.filter(specialty=param['especialidade'])


class DoctorViewSet(ModelViewSet):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        querys = request.query_params
        queryset = Doctor.objects.all()
        serializer = DoctorSerializer(queryset, many=True)

        if len(querys) > 0:
            doctors = return_query(querys)
            serializer = DoctorSerializer(doctors, many=True)
            return Response(serializer.data)
        else:
            return Response(serializer.data)
