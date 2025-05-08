# Projeto WordPress no Railway

Este repositório contém a estrutura Docker para o nosso site WordPress, usado para desenvolvimento e prototipagem do site do time verde.

---

## Pré-requisitos 

Para rodar o projeto localmente ou fazer o deploy no Railway, você precisa ter:

- Git instalado
- Docker e Docker Compose (para rodar localmente)
- Conta gratuita no [Railway](https://railway.app)

---

## Como baixar o repositório

Abra o terminal e execute:

bash
- git clone https://github.com/usuario/nome-do-repositorio.git
- cd nome-do-repositorio

---

### COMO RODAR LOCALMENTE
 Com Docker e Docker Compose instalados, rode:
- docker compose up -d
  
 No navegador acesse:
- http://localhost:8080

 Parar e remover os containers:
- docker compose stop         # apenas pausa
- docker compose start        # reinicia
- docker compose down         # remove tudo

### COMO HOSPEDAR NO RAILWAY (SERVIDOR REMOTO)
1. Crie um projeto no Railway

    Acesse https://railway.app e faça login.

    Clique em "New Project" → Deploy from GitHub repo

    Escolha o seu repositório com o Dockerfile (FROM wordpress:latest).
   
2. Configure o serviço WordPress (Docker)

    O Railway detectará o Dockerfile automaticamente.

    Dê um nome para o serviço (ex: wordpress-app).

3. Adicione um banco de dados

    Clique em "New" > "Provision PostgreSQL" ou "Provision MySQL" (escolha MySQL/MariaDB).

    Aguarde a criação do banco.

    Copie as variáveis de ambiente geradas: MYSQLHOST, MYSQLUSER, MYSQLPASSWORD, MYSQLDATABASE, etc.

4. Configure variáveis de ambiente no serviço WordPress
WORDPRESS_DB_HOST=<host>:<port>
WORDPRESS_DB_USER=<usuário>
WORDPRESS_DB_PASSWORD=<senha>
WORDPRESS_DB_NAME=<nome do banco>

Use os valores do serviço MySQL do Railway. Exemplo:

WORDPRESS_DB_HOST=containers-us-west-123.railway.app:1234
WORDPRESS_DB_USER=railway
WORDPRESS_DB_PASSWORD=senha_gerada
WORDPRESS_DB_NAME=railway

5. Gere o domínio do seu site WordPress

    No serviço wordpress-app, clique em "Settings" → "Generate Domain".

    Acesse o link gerado para instalar e configurar o WordPress online.
 

