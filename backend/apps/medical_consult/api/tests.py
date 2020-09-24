from django.test import TestCase
from faker import Faker
import requests


class MedicalConsultTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO MEDICAL CONSULT API (consultas) -------')
        print("Configurando testes para o endpoint Accounts")
        print("MUDAR TOKEN PARA UM VALIDO PARA TESTAR")
        self.faker = Faker('pt-BR')
        self.base_url = 'http://127.0.0.1:8000/api/'
        self.token = '2b7a7a4dbd0994eb964388e3efaaa9e4a1a82a77877ac7bb4e52a9dd05ddd1d9'
        self.req = requests.Session()

