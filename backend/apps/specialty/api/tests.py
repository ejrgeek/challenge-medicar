from django.test import TestCase
from faker import Faker
import requests


class SpecialtyApiTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO SPECIALTY API (especialidades) -------')
        print("Configurando testes para o endpoint Specialty")
        print("MUDAR TOKEN PARA UM VALIDO")
        self.faker = Faker('pt-BR')
        self.base_url = 'http://127.0.0.1:8000/api/'
        self.token = '8ff26923305f3c69aaedd5a1162b7555a8a1b48306a80b6f3b6cd3e51d9c7977'
        self.req = requests.Session()

    def test_fail_get_specialty(self):
        print("Get no endoint de listagem sem token")
        response = self.req.get(
            url=f'{self.base_url}especialidades/',
        )
        self.assertEqual(response.status_code, 401)

    def test_get_specialty(self):
        print("Get no endoint de listagem com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.get(
            url=f'{self.base_url}especialidades/',
        )
        self.assertEqual(response.status_code, 200)

    def test_fail_create_specialty_without_token(self):
        print("Post no endpoint de especialidade, não pode criar sem token")
        response = self.req.post(
            url=f'{self.base_url}especialidades/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_create_specialty_with_token(self):
        print("Post no endpoint de especialidade, não pode criar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.post(
            url=f'{self.base_url}especialidades/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_update_specialty_without_token(self):
        print("Put no endpoint de especialidade, não pode atualizar sem token")
        response = self.req.put(
            url=f'{self.base_url}especialidades/1/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_update_specialty_with_token(self):
        print("Put no endpoint de especialidade, não pode pode atualizar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.put(
            url=f'{self.base_url}especialidades/1/',
            json={'name': self.faker.job()}
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_delete_specialty_without_token(self):
        print("Delete no endpoint de especialidade, não pode deletar sem token")
        response = self.req.put(
            url=f'{self.base_url}especialidades/1/',
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_delete_specialty_with_token(self):
        print("Delete no endpoint de especialidade, não pode pode deletar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.put(
            url=f'{self.base_url}especialidades/1/',
        )
        self.assertEqual(response.status_code, 405)
