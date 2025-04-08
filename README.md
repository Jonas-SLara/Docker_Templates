
# Projeto WordPress no Railway

Este repositório contém a estrutura Docker para o nosso site WordPress, usado para desenvolvimento e prototipagem.

## Como baixar o Repositorio ,nescessario ter o git instalado
no terminal digite 
git init
git clone (link do repositorio)


## Como rodar localmente

```bash
docker compose up -d
no navegador acesse localhost:8080 ou http://localhost:8080

revise os comando do docker para parar e excluir containers
docker compose down 
docker compose stop
docker compose start
 
# exportar e importar o xml localmente ou externo
-- guardar o xml das alterações feitas dentro da pasta wp_data e dar o push ou pull request no repositorio

## Como rodar o wordpress pelo railway
no railway vai criar um novo projeto
depois crie um serviço apartir de um repositorio e use este que tenha o dockerfile ou uma copia dele
crie um novo serviço para o banco de dados
copie as variaves do banco de dados para a conexao como host user db e password
inicialize as variaveis de ambiente com os valores que copiou no serviço wordpress para que ele se conecte com o banco
depois é só gerar uma url

##como acessar o wordpress com a url do railway
https://seu link.up.railway.app/ -vai para a instalação caso nao instalou ainda e depois para o login
se ja estiver instalado ele vai para a pagina do site
caso seja um colaborador ou admin e quer acessar para poder editar coloque /wp-admin ou /wp-login.php no final



