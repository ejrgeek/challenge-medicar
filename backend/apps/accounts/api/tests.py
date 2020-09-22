from django.test import TestCase
from faker import Faker
import requests


class ScheduleApiTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO ACCOUNTS API (contas - autenticacao) -------')
        print("Configurando testes para o endpoint Accounts")
        print("MUDAR TOKEN PARA UM VALIDO PARA TESTAR O LOGOUT")
        self.faker = Faker('pt-BR')
        self.base_url = 'http://127.0.0.1:8000/api/'
        self.token = '2d0f69fb685ec0ac816cba309f78b3f061f4549912f5ea0b5db0cf316f806f2e'
        self.login = 'logInOut'
        self.password = 'Password@123'
        self.req = requests.Session()

    def test_fail_register(self):
        print("Falhando ao criar usuário faltando algum parametro")
        response = self.req.post(
            url=f'{self.base_url}register/',
            json={
                "first_name": self.faker.name(),
                "username": self.faker.simple_profile()['username'],
                "email": self.faker.email(),
            }
        )
        self.assertEqual(response.status_code, 400)

    def test_regsiter(self):
        print("Criando usuário")
        response = self.req.post(
            url=f'{self.base_url}register/',
            json={
                "first_name": self.faker.name(),
                "username": self.faker.simple_profile()['username'],
                "email": self.faker.email(),
                "password": self.faker.password()
            }
        )
        self.assertEqual(response.status_code, 200)

    def test_fail_login(self):
        print("Falhando no login faltando algum parametro")
        response = self.req.post(
            url=f'{self.base_url}login/',
            json={
                "username": self.login
            }
        )
        self.assertEqual(response.status_code, 400)

    async def test_login(self):
        print("Login válido")
        response = self.req.post(
            url=f'{self.base_url}login/',
            json={
                "username": self.login,
                "password": self.password
            }
        )

        self.assertEqual(response.status_code, 200)

    def test_fail_logout_invalid_token(self):
        print("Falhando no logout do usuário com token invalido")
        self.req.headers.update(
            {"Authorization": f"token 4d65as4d65asd4a6s5d4as654da6s5d4a6s5d4a6s5d4"}
        )
        response = self.req.post(
            url=f'{self.base_url}logout/',
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_logout_without_token(self):
        print("Falhando no logout do usuário sem token")
        response = self.req.post(
            url=f'{self.base_url}logout/',
        )
        self.assertEqual(response.status_code, 401)

    async def test_logout(self):
        print("Logout do usuário com token Valido")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.post(
            url=f'{self.base_url}logout/',
        )
        self.assertEqual(response.status_code, 204)
