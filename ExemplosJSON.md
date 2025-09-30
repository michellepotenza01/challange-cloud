# Exemplos JSON para Swagger (GET, POST, PUT, DELETE)
Disponivel na url:
https://mottu-api.azurewebsites.net/swagger-ui/swagger-ui/index.html#/


                        Patio
POST
{
  "localizacao": "Osasco - SP",
  "quantidadeVagas": 50
}

PUT
{
  "idPatio": 1,
  "localizacao": "Barueri - SP",
  "quantidadeVagas": 70
}

DELETE
{
    id:1

  "message": "Pátio removido com sucesso."
}
----------------------------------------------------
                        Moto
POST
{
  "modelo": "Honda CG 160",
  "placa": "ABC1D23",
  "status": "disponivel",
  "setor": "bom"
}

PUT
{
  "idMoto": 1,
  "modelo": "Yamaha Factor 150",
  "placa": "XYZ9H45",
  "status": "alugada",
  "setor": "intermediario"
}

DELETE
{
    id:1
  "message": "Moto removida com sucesso."
}
-------------------------------------------------------
                        Funcionário
POST
{
  "nomeUsuario": "admin01",
  "email": "admin@mottu.com",
  "senha": "123456"
}

PUT
{
  "idFuncionario": 1,
  "nomeUsuario": "admin02",
  "email": "admin02@mottu.com",
  "senha": "novaSenha123"
}
DELETE
{
    id: 1
  "message": "Funcionário removido com sucesso."
}
--------------------------------------------------------
                        Cliente
POST
{
  "nome": "João Silva",
  "email": "joao.silva@email.com",
  "cpf": "123.456.789-00",
  "telefone": "(11) 98765-4321",
  "dataNascimento": "1999-05-15"
}

PUT
{
  "idCliente": 1,
  "nome": "João Pedro Silva",
  "email": "joao.pedro@email.com",
  "cpf": "123.456.789-00",
  "telefone": "(11) 91234-5678",
  "dataNascimento": "1999-05-15"
}
DELETE
{
    id: 1
  "message": "Cliente removido com sucesso."
}

---------------------------------------------------
Scripts de consultas CRUD no Banco:
mottuDB (mottu-sql-server/mottuDB) | Query editor 

Para tabela clientes:
select * from [dbo].[tab_clientes];

Para tabela motos:
select * from [dbo].[tab_motos];

Para tabela funcionarios:
select * from [dbo].[tab_funcionarios];

Para tabela clientes:
select * from [dbo].[tab_clientes];
