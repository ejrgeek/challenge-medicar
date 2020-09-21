from django.test import TestCase
from .models import Specialty
from faker import Faker
# Create your tests here.


class SpecialtyTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO SPECIALTY (especialidades) -------')
        print("Configurando testes do model Specialty")
        self.faker = Faker('pt_BR')

    def test_create_specialty(self):
        print("Testando criação de especialidade")
        specialty = Specialty.objects.create(name=self.faker.name())
        specialty.save()
        query = Specialty.objects.get(name=specialty.name)
        self.assertEquals(specialty.name, query.name)
