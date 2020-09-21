from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from .serializers import ScheduleSerializer
from apps.schedule.models import Schedule
from rest_framework.permissions import IsAuthenticated


class ScheduleViewSet(ModelViewSet):

    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        queryset = Schedule.objects.all()
        serializer = ScheduleSerializer(queryset, many=True)
        return Response(serializer.data)
