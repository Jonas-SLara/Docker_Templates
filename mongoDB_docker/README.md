#Modelo ER
-----------

![Modelo ER img](modeloER_setorImobiliario.drawio.png)

-    Uma corretora de imóveis dejesa um sistema que armazene os dados dos
- aluguéis de imóveis de seus clientes e proprietários contatados.
-    Cada proprietário possui vários imóveis e o imóvel está associado a um 
- proprietário e um Inquilino, sobre o imóvel se dejesa saber o aluguel e nome
- já o proprietário se dejesa anotar o celular e o nome.
-     O proprietário pode contratar mais de um Corretor da corretora e cada Corretor
- pode trabalhar para mais de um Proprietário, O corretor atende Multiplos Clientes,
- o cliente que fecha um contrato passa a ser Inquilino daquele imóvel, e só pode estar
- associado a um imóvel Sobre o Inquilino se dejesa saber o nome e celular e
- no corretor, o nome e seu celular para contato.


##Rodando o Mongo no Docker Cli (terminal)

##Versões mais recentes > mongodb:5
- docker exec -it mongodb mongosh -u root -p root1234

##Versões Mais antigas < mongodb:4.4
- docker exec -it mongodb mongo -u root -p root1234

- Referências (normalização): um documento aponta para outro com ID
- Documentos embutidos (desnormalização): aninhamos os dados dentro de outro documento

#Base de Dados - Versão 1 – Referenced Relationships

use imobiliaria

db.createCollection("proprietarios")
db.createCollection("imoveis")
db.createCollection("corretores")
db.createCollection("inquilinos")

db.proprietarios.insertOne({
  _id: "prop1",
  nome: "João da Silva",
  celular: "99999-0000",
  imoveis: ["imov1"],
  corretores: ["cor1"]
})

db.imoveis.insertOne({
  _id: "imov1",
  nome: "Casa Centro",
  aluguel: 1200,
  proprietario_id: "prop1",
  inquilino_id: "inq1"
})

db.corretores.insertOne({
  _id: "cor1",
  nome: "Maria Souza",
  celular: "98888-1234",
  proprietarios: ["prop1"],
  inquilinos: ["inq1"]
})

db.inquilinos.insertOne({
  _id: "inq1",
  nome: "Carlos Lima",
  celular: "97777-4567",
  imovel_id: "imov1",
  corretores: ["cor1"]
})

db.proprietarios.find().pretty()
db.imoveis.find().pretty()
db.corretores.find().pretty()
db.inquilinos.find().pretty()


#Base de Dados - Versão 2 – Embedded Relationships

use imobiliaria

{
  "_id": "prop1",
  "nome": "João da Silva",
  "celular": "99999-0000",

  "corretores": [
    {
      "idcor": "cor1",
      "nome": "Maria Souza",
      "celular": "98888-1234"
    },
    {
      "idcor": "cor2",
      "nome": "Paulo Almeida",
      "celular": "97777-0000"
    }
  ],

  "imoveis": [
    {
      "idmov": "imov1",
      "nome": "Casa Centro",
      "aluguel": 1200.00,

      "inquilino": {
        "idinq": "inq1",
        "nome": "Carlos Lima",
        "celular": "97777-4567",
        "corretores": [
          {
            "idcor": "cor1",
            "nome": "Maria Souza",
            "celular": "98888-1234"
          }
        ]
      }
    },
    {
      "idmov": "imov2",
      "nome": "Apartamento Sul",
      "aluguel": 1600.00,
      "inquilino": null
    }
  ]
}

