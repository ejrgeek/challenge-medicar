from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from apps.schedule.models import Schedule
from .serializers import ScheduleSerializer


def return_query(param):
    if 'medico' in param.keys() and 'especialidade' in param.keys():
        return Schedule.objects\
                .filter(doctor__specialty=param['especialidade'])\
                .filter(doctor=param['medico'])
    elif 'especialidade' in param.keys():
        return Schedule.objects.filter(doctor__specialty=param['especialidade'])
    elif 'medico' in param.keys():
        return Schedule.objects.filter(doctor=param['medico'])


class ScheduleViewSet(ModelViewSet):
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
    permission_classes = [IsAuthenticated]
    http_method_names = ['get']

    def list(self, request, *args, **kwargs):
        querys = request.query_params
        queryset = Schedule.objects.all()
        serializer = ScheduleSerializer(queryset, many=True)
        print(querys)

        if len(querys) > 0:
            schedules = return_query(querys)
            serializer = ScheduleSerializer(schedules, many=True)
            return Response(serializer.data)
        else:
            return Response(serializer.data)
