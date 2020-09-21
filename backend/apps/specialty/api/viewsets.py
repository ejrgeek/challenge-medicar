from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from .serializers import SpecialtySerializer
from apps.specialty.models import Specialty
from rest_framework.permissions import IsAuthenticated


class SpecialtyViewSet(ModelViewSet):

    queryset = Specialty.objects.all()
    serializer_class = SpecialtySerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        queryset = Specialty.objects.all()
        serializer = SpecialtySerializer(queryset, many=True)
        return Response(serializer.data)