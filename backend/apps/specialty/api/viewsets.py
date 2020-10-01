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
        querys = request.query_params
        queryset = Specialty.objects.all()
        serializer = SpecialtySerializer(queryset, many=True)

        if 'search' in querys.keys():
            specialty = Specialty.objects.filter(
                name__icontains=querys['search']
            )
            serializer = SpecialtySerializer(specialty, many=True)
            return Response(serializer.data)
        else:
            return Response(serializer.data)
