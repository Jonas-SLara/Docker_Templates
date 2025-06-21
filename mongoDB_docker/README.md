# Modelo ER
-----------

![Modelo ER img](modeloER_setorImobiliario.drawio.png)

    Uma corretora imobiliaria de imóveis dejesa um sistema que armazene os dados dos
seus proprietários cadastrados e de suas respectivas propriedades e inquilinos.
    Cada Proprietáro pode ter mais de uma propriedade e cada uma tem seu respectivo dono,
as propriedades são alugadas por inquilinos e cada inquilino pode alugar mais de uma propriedade
em diferentes datas.
    Sobre cada casa deve ser armazenado nome, aluguel e endereço contendo o numero da casa, rua e
cep, no inquilino dejesa saber o seu nome e celular para contato e o mesmo é com o proprietario.

## Rodando o Mongo no Docker Cli (terminal)

## Versões mais recentes > mongodb:5
- docker exec -it mongodb mongosh -u root -p root1234

## Versões Mais antigas < mongodb:4.4
- docker exec -it mongodb mongo -u root -p root1234

- Referências (normalização): um documento aponta para outro com ID
- Documentos embutidos (desnormalização): aninhamos os dados dentro de outro documento

# Base de Dados - Versão 1 – Referenced Relationships


# Base de Dados - Versão 2 – Ebedded Relationships

