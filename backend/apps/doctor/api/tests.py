from django.test import TestCase
from faker import Faker
import requests


class DoctorApiTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO DOCTOR API (médicos) -------')
        print("Configurando testes para o endpoint Doctors")
        print("MUDAR TOKEN PARA UM VALIDO")
        self.faker = Faker('pt-BR')
        self.base_url = 'http://127.0.0.1:8000/api/'
        # MUDAR TOKEN PARA UM VALIDO
        self.token = '8ff26923305f3c69aaedd5a1162b7555a8a1b48306a80b6f3b6cd3e51d9c7977'
        self.req = requests.Session()

    def test_fail_get_doctors(self):
        print("Get no endoint de listagem sem token")
        response = self.req.get(
            url=f'{self.base_url}medicos/',
        )
        self.assertEqual(response.status_code, 401)

    def test_get_doctors(self):
        print("Get no endoint de listagem com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.get(
            url=f'{self.base_url}medicos/',
        )
        self.assertEqual(response.status_code, 200)

    def test_fail_create_doctor_without_token(self):
        print("Post no endpoint de medico, não pode criar sem token")
        response = self.req.post(
            url=f'{self.base_url}medicos/',
            json={
                "crm": self.faker.pyint(),
                "nome": self.faker.name(),
                "especialidade": 2
            }
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_create_doctor_with_token(self):
        print("Post no endpoint de medicos, não pode criar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.post(
            url=f'{self.base_url}medicos/',
            json={
                "crm": self.faker.pyint(),
                "nome": self.faker.name(),
                "especialidade": 2
            }
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_update_doctor_without_token(self):
        print("Patch no endpoint de medico, não pode atualizar sem token")
        response = self.req.patch(
            url=f'{self.base_url}medicos/1/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_update_doctor_with_token(self):
        print("Patch no endpoint de medico, não pode pode atualizar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.patch(
            url=f'{self.base_url}medicos/1/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_delete_doctor_without_token(self):
        print("Delete no endpoint de medico, não pode atualizar sem token")
        response = self.req.delete(
            url=f'{self.base_url}medicos/1/',
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_delete_doctor_with_token(self):
        print("Delete no endpoint de medico, não pode pode atualizar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.delete(
            url=f'{self.base_url}medicos/1/',
        )
        self.assertEqual(response.status_code, 405)
