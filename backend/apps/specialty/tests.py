from django.test import TestCase
from .models import Specialty
from faker import Faker
# Create your tests here.


class SpecialtyTestCase(TestCase):

    def setUp(self):
        print('Configurando teste de especialidade')
        self.faker = Faker()

    def test_create_specialty(self):
        print("Testando criação de especialidade")
        specialty = Specialty.objects.create(name=self.faker.name())
        specialty.save()
        query = Specialty.objects.get(name=specialty.name)
        self.assertEquals(specialty.name, query.name)
