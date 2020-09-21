from django.test import TestCase
from .models import Doctor
from faker import Faker
from apps.specialty.models import Specialty
# Create your tests here.


class DoctorTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO DOCTOR (médico) -------')
        print("Configurando testes do model Doctor")
        self.faker = Faker('pt_BR')
        self.specialty = Specialty.objects.create(name=self.faker.job())

    def test_create_doctor_only_required_fields(self):
        print("Testando criação de médico apenas com nome e crm")
        doctor = Doctor.objects.create(
            name=self.faker.name(),
            crm=self.faker.random_number(),
        )
        doctor.save()
        query = Doctor.objects.get(name=doctor.name)
        self.assertEqual(doctor.name, query.name)

    def test_create_doctor(self):
        print("Testando criação de médico")
        doctor = Doctor.objects.create(
            name=self.faker.name(),
            crm=self.faker.random_number(),
            email=self.faker.email(),
            phone=self.faker.phone_number(),
            specialty=self.specialty,
        )
        doctor.save()
        query = Doctor.objects.get(name=doctor.name)
        self.assertEqual(doctor.name, query.name)
