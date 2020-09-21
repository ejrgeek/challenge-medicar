from django.core.exceptions import ValidationError
from django.test import TestCase
from .models import Schedule
from apps.doctor.models import Doctor
from apps.specialty.models import Specialty
from faker import Faker
from datetime import datetime
# Create your tests here.


class DoctorTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO SCHEDULR (agenda para médico) -------')
        print("Configurando testes do model Schedule")
        self.faker = Faker('pt_BR')
        self.mock_date = datetime.fromtimestamp(1604975388)
        self.specialty = Specialty.objects.create(name=self.faker.job())
        self.doctor = Doctor.objects.create(
            name=self.faker.name(),
            crm=self.faker.random_number(),
            email=self.faker.email(),
            phone=self.faker.phone_number(),
            specialty=self.specialty,
        )

    def test_create_schedule(self):
        print("Testando criação de agenda")
        schedule = Schedule.objects.create(
            doctor=self.doctor,
            day=self.mock_date.date(),
            schedules=datetime.now().time()
        )
        schedule.save()
        query = Schedule.objects.get(doctor=schedule.doctor)
        self.assertEqual(self.doctor, query.doctor)

    def test_fail_create_schedule(self):
        print("Testando falha na criação de agenda")

        with self.assertRaises(ValidationError):
            schedule = Schedule.objects.create(
                doctor=self.doctor,
                day=datetime.now().date(),
                schedules=datetime.now().time()
            )
            schedule.save()

