from django.test import TestCase
from faker import Faker
import requests


class ScheduleApiTestCase(TestCase):

    def setUp(self):
        print('\n------- MODULO SCHEDULE API (agendas) -------')
        print("Configurando testes para o endpoint Schedule")
        print("MUDAR TOKEN PARA UM VALIDO")
        self.faker = Faker('pt-BR')
        self.base_url = 'http://127.0.0.1:8000/api/'
        self.token = '8ff26923305f3c69aaedd5a1162b7555a8a1b48306a80b6f3b6cd3e51d9c7977'
        self.req = requests.Session()

    def test_fail_get_schedule(self):
        print("Get no endoint de listagem sem token")
        response = self.req.get(
            url=f'{self.base_url}agendas/',
        )
        self.assertEqual(response.status_code, 401)

    def test_get_schedule(self):
        print("Get no endoint de listagem com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.get(
            url=f'{self.base_url}agendas/',
        )
        self.assertEqual(response.status_code, 200)

    def test_fail_create_schedule_without_token(self):
        print("Post no endpoint de agendas, não pode criar sem token")
        response = self.req.post(
            url=f'{self.base_url}agendas/',
            json={
                'doctor': 3,
                'day': '2020-02-12'
            }
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_create_schedule_with_token(self):
        print("Post no endpoint de agendas, não pode criar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.post(
            url=f'{self.base_url}agendas/',
            json={
                'doctor': 3,
                'day': '2020-02-12'
            }
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_update_schedule_without_token(self):
        print("Patch no endpoint de agendas, não pode atualizar sem token")
        response = self.req.patch(
            url=f'{self.base_url}agendas/1/',
            json={'doctor': 2}
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_update_schedule_with_token(self):
        print("Patch no endpoint de agendas, não pode pode atualizar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.patch(
            url=f'{self.base_url}agendas/1/',
            json={'doctor': 2}
        )
        self.assertEqual(response.status_code, 405)

    def test_fail_delete_schedule_without_token(self):
        print("Delete no endpoint de agendas, não pode atualizar sem token")
        response = self.req.delete(
            url=f'{self.base_url}agendas/1/',
        )
        self.assertEqual(response.status_code, 401)

    def test_fail_delete_schedule_with_token(self):
        print("Delete no endpoint de agendas, não pode pode atualizar com token")
        self.req.headers.update(
            {"Authorization": f"token {self.token}"}
        )
        response = self.req.delete(
            url=f'{self.base_url}agendas/1/',
        )
        self.assertEqual(response.status_code, 405)
