# Base de dados

```
db.imobiliaria.insertMany([
  {
    _id: "prop1",
    nome: "Ruan",
    celular: "(55) 90000-1111",
    imoveis: [
      {
        _id: "casa1",
        nome: "chácara do campestre",
        aluguel: 1500,
        endereco: {
          cep: "12000-000",
          rua: "Rua das Flores",
          numero: 101
        },
        alugueis: [
          {
            data: ISODate("2005-05-01"),
            inquilino: {
              _id: "inq1",
              nome: "Joana Martins",
              celular: "(55) 91111-2222"
            }
          },
          {
            data: ISODate("2025-06-01"),
            inquilino: {
              _id: "inq3",
              nome: "Ana Souza",
              celular: "(11) 98888-5555"
            }
          }
        ]
      },
      {
        _id: "casa2",
        nome: "Casa 102",
        aluguel: 2200,
        endereco: {
          cep: "12888-001",
          rua: "Rua das Laranjas",
          numero: 102
        },
        alugueis: [
          {
            data: ISODate("2015-01-10"),
            inquilino: {
              _id: "inq2",
              nome: "Carlos Tavares",
              celular: "(21) 97777-4444"
            }
          }
        ]
      }
    ]
  },
  {
    _id: "prop2",
    nome: "Ursula",
    celular: "(22) 98080-1001",
    imoveis: [
      {
        _id: "casa3",
        nome: "Casa 201",
        aluguel: 3100,
        endereco: {
          cep: "12000-222",
          rua: "Av. Central",
          numero: 201
        },
        alugueis: [
          {
            data: ISODate("2020-03-15"),
            inquilino: {
              _id: "inq1",
              nome: "Joana Martins",
              celular: "(55) 91111-2222"
            }
          }
        ]
      },
      {
        _id: "casa4",
        nome: "Casa 202",
        aluguel: 3300,
        endereco: {
          cep: "12000-223",
          rua: "Av. Central",
          numero: 202
        },
        alugueis: [
          {
            data: ISODate("2023-06-01"),
            inquilino: {
              _id: "inq3",
              nome: "Ana Souza",
              celular: "(11) 98888-5555"
            }
          }
        ]
      }
    ]
  }
])


```
## buscar os  inquilinos que alugam casas com aluguel abaixo de 2000,00 apartir de 2025-01-01

```

db.imobiliaria.aggregate([
  { $unwind: "$imoveis" },
  { $match: { "imoveis.aluguel": { $lt: 2000 } } },
  { $unwind: "$imoveis.alugueis" },
  {
    $match: {
      "imoveis.alugueis.data": { $gte: ISODate("2025-01-01") }
    }
  },
  {
    $project: {
      _id: 0,
      inquilino: "$imoveis.alugueis.inquilino.nome",
      celular: "$imoveis.alugueis.inquilino.celular",
      casa: "$imoveis.nome",
      aluguel: "$imoveis.aluguel",
      data: "$imoveis.alugueis.data"
    }
  }
])

```

## mostrar todas as casas da proprietária ursula
```
db.imobiliaria.aggregate([
  {
    $match: { nome: "Ursula" } 
  },
  {
    $unwind: "$imoveis" 
  },
  {
    $project: {
      _id: 0,
      nome_casa: "$imoveis.nome",
      aluguel: "$imoveis.aluguel",
      endereco: "$imoveis.endereco"
    }
  }
]).pretty()

```