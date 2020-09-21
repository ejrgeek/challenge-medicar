from django.core.exceptions import ValidationError
from django.db.utils import IntegrityError
from django.test import TestCase
from .models import Schedule, Timetable
from apps.doctor.models import Doctor
from apps.specialty.models import Specialty
from faker import Faker
from datetime import datetime
# Create your tests here.


class ScheduleTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO SCHEDULR (agenda para médico) -------')
        print("Configurando testes do model Schedule")
        self.faker = Faker('pt_BR')
        self.mock_date_future = datetime.fromtimestamp(1604975388)
        self.mock_date_past = datetime.fromtimestamp(1594348188)
        self.specialty = Specialty.objects.create(name=self.faker.job())
        self.time = Timetable.objects.bulk_create(
            [
                Timetable(time=self.faker.time()),
                Timetable(time=self.faker.time()),
                Timetable(time=self.faker.time()),
                Timetable(time=self.faker.time()),
            ]
        )
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
            day=self.mock_date_future.date(),
        )
        schedule.save()
        query = Schedule.objects.get(doctor=schedule.doctor)
        self.assertEqual(self.doctor, query.doctor)

    def test_fail_create_schedule_ony_day_doctor(self):
        print("Testando falha na criação de agenda: Apenas uma agenda para um médico por dia")

        with self.assertRaises(IntegrityError):
            schedule = Schedule.objects.create(
                doctor=self.doctor,
                day=self.mock_date_future.date(),
            )
            schedule.save()
            schedule = Schedule.objects.create(
                doctor=self.doctor,
                day=self.mock_date_future.date(),
            )
            schedule.save()

    def test_fail_create_schedule_past_days(self):
        print("Testando falha na criação de agenda: Não cria com um dia que ja passou")

        with self.assertRaises(ValidationError):
            schedule = Schedule.objects.create(
                doctor=self.doctor,
                day=self.mock_date_past.date(),
            )
            schedule.save()
