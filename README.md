
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

