import json

from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from .serializers import DoctorSerializer
from apps.doctor.models import Doctor
from rest_framework.permissions import IsAuthenticated


def format_query_params(query):
    try:
        query = query.strip('/api/medicos/')
        query = query.replace('search', 'name') \
            .replace('especialidade', 'specialty') \
            .replace('=', '":"') \
            .replace('?', '{"') \
            .replace('&', '","')
        query = query
        query += '"}'
        query = json.loads(query)
        return query
    except Exception:
        return {}


class DoctorViewSet(ModelViewSet):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        query = request.get_full_path()
        query = format_query_params(query)
        queryset = Doctor.objects.all()
        serializer = DoctorSerializer(queryset, many=True)

        if len(query) > 0:
            doctors = Doctor.objects \
                .filter(name__icontains=query['name']) \
                .filter(specialty=query['specialty'])
            serializer = DoctorSerializer(doctors, many=True)
            return Response(serializer.data)
        else:
            return Response(serializer.data)




