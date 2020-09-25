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
        self.token = '8cdc439120b7efb48f3d4b3af82ffd227a1a481a60a04cf07997834525809e88'
        self.req = requests.Session()

    def test_fail_get_consults(self):
        print("Não pode ver consultas")
        response = self.req.get(
            url=f'{self.base_url}consultas/',
        )
        self.assertEqual(response.status_code, 401)

    def test_get_user_consult_by_token(self):
        print("Não pode ver consulta de outro usuário")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.get(
            url=f'{self.base_url}consultas/',
        )
        self.assertEqual(response.status_code, 200)

    def test_fail_create_duplicate_consult(self):
        print("Não pode criar consultas no mesmo dia e mesma hora")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        self.req.post(
            url=f'{self.base_url}consultas/',
            json={
                "day": "2020-10-12",
                "time": "14:00",
                "doctor": 4
            }
        )
        response = self.req.post(
            url=f'{self.base_url}consultas/',
            json={
                "day": "2020-10-12",
                "time": "14:00",
                "doctor": 4
            }
        )
        self.assertEqual(response.status_code, 403)

    def test_create_consult(self):
        print("Criação de consulta")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.post(
            url=f'{self.base_url}consultas/',
            json={
                "day": "2020-10-13",
                "time": "14:00",
                "doctor": 4
            }
        )
        self.assertEqual(response.status_code, 200)

    def test_delete_consult_from_another_user(self):
        print("Deletar de consulta de outro usuário")
        print("Precisa mudar o ID")
        id_consult = 30
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.delete(
            url=f'{self.base_url}consultas/{id_consult}/',
        )
        self.assertEqual(response.status_code, 403)

    def test_delete_consult(self):
        print("Deletar de consulta")
        print("Precisa mudar o ID")
        id_consult = 27
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.delete(
            url=f'{self.base_url}consultas/{id_consult}/',
        )
        self.assertEqual(response.status_code, 204)
