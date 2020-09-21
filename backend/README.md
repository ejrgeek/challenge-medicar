# Medicar Api
API para a aplicação web Medicar
### Setup:
Requisitos:
* Python 3.6+
* PostgreSQL 

Recomendação - configurando o PostgreSQL (mude nome do banco, nome do usuário e senha):

    sudo -i -u postgres psql
    CREATE DATABASE nome_do_banco;
    CREATE USER nome_usuario WITH PASSWORD 'sua_senha';
    ALTER ROLE nome_usuario SET client_encoding TO 'utf8';
    ALTER ROLE nome_usuario SET default_transaction_isolation TO 'read committed';
    ALTER ROLE nome_usuario SET timezone TO 'UTC';
    GRANT ALL PRIVILEGES ON DATABASE nome_do_banco TO nome_usuario;
    
Agora você precisa clonar o repositório

    git clone https://github.com/ejrgeek/challenge-medicar.git

Depois caso queira, pode criar um novo ambiente virtual para rodar a aplicação, você pode ler aqui para saber mais caso não tenha conhecimento sobre: https://pythonacademy.com.br/blog/python-e-virtualenv-como-programar-em-ambientes-virtuais

Depois de criado, você entra no ambiente e roda os comandos

    pip install -r requirements.txt

Agora vá no arquivo *settings.py* e altere o bloco de acordo com os dados que você criout anteriormente:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'medicar_db',
            'USER': 'ejrgeek',
            'PASSWORD': 'sy0qbei8',
            'HOST': '127.0.0.1',
            'PORT': '5432',
        }
    }
    
Pronto, agora rode os comandos:

    python manage.py makemigrations
    python manage.py migrate
    

Para fazer a migração das tabelas do banco de dados baseados nos Models do Django gerado pelo ORM. Depois você pode rodar o comando para criar um super usuario:
    
    python manage.py createsuperuser

Depois você pode rodar um:

    python manage.py runserver
    
A aplicação está no ar (localmente pelo menos rs). Ainda é necessário algumas configurações.

Caso você deseje fazer consumo da Api, pesque no arquivo *settings.py* a lista **CORS_ORIGIN_WHITELIST** e adicione o endereço:porta na lista para não ter problemas.

Para os testes nos models, foi utilizado o [Faker](https://faker.readthedocs.io/en/master/) para gerar dados fictícios, TestCase do Django e o [Factory Boy](https://pypi.org/project/factory-boy/). Para rodar os testes, use o comando *python manage.py test*.

Para saber como testar a API, disponibilizei a documentação, pode ser acessada nesse link: [Documentação da API]()
