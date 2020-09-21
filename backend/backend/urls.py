"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from knox import views as knox_views
from apps.specialty.api.viewsets import SpecialtyViewSet
from apps.doctor.api.viewsets import DoctorViewSet
from apps.schedule.api.viewsets import ScheduleViewSet
from apps.accounts.api.views import RegisterUserApi, LoginUserAPI

router = routers.DefaultRouter()
router.register('especialidades', SpecialtyViewSet)
router.register('medicos', DoctorViewSet)
router.register('agendas', ScheduleViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/login/', LoginUserAPI.as_view(), name='login'),
    path('api/logout/', knox_views.LogoutView.as_view(), name='logout'),
    path('api/register/', RegisterUserApi.as_view(), name='register'),
]
