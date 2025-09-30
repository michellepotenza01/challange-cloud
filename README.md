# Challange-Cloud

## Descrição da Solução

A **MottuApi** é uma aplicação em **Java** que realiza a gestão de **pátios**, **motos**, **clientes** e **funcionários**. A aplicação foi desenvolvida para ser hospedada no **Azure App Service (PaaS)**, com a base de dados sendo armazenada no **Azure SQL Database**. Esse repositório contém todos os arquivos e scripts necessários para configurar e rodar a aplicação no **Microsoft Azure**.


## Benefícios para o Negócio

- **Centralização da gestão**: Substitui planilhas manuais por uma solução digital ágil e prática.
- **Agilidade operacional**: Controle de pátios, vagas e motos em tempo real.
- **Segurança**: Armazenamento em banco corporativo na nuvem com controle de acesso.
- **Escalabilidade**: A aplicação hospedada no Azure App Service (PaaS) pode ser escalada conforme a demanda.
- **Disponibilidade**: Acesso remoto seguro e confiável para clientes e funcionários.

## Arquitetura da Solução

### Componentes:
- **Azure Resource Group**: Agrupador lógico de todos os recursos.
- **Azure SQL Database (PaaS)**: Banco de dados relacional para persistência das entidades.
- **Azure App Service (PaaS)**: Ambiente gerenciado para hospedar a API em Java.
- **Azure CLI**: Utilizado para provisionamento e deploy.

### Fluxo:
1. O usuário acessa o **Swagger** hospedado no **App Service**.
2. As requisições são processadas pela **API**.
3. A **API** se conecta ao **Azure SQL Database** para leitura e escrita.
4. As respostas são retornadas ao usuário.

## Principais Entidades da API

- **Pátio**: Controla a localização e quantidade de vagas.
- **Funcionário**: Registra usuários responsáveis pela operação.
- **Moto**: Armazena dados sobre cada moto (modelo, placa, status, setor).
- **Cliente**: Usuários que podem alugar motos.

## Tecnologias Utilizadas

- **Java 17 + Spring Boot**: Aplicação principal da API.
- **Azure SQL Database**: Persistência de dados.
- **Azure App Service**: Hospedagem da API.
- **Azure CLI**: Provisionamento e deploy.
- **Swagger/OpenAPI**: Documentação e testes de endpoints.

## Repositorio java
https://github.com/michellepotenza01/challange-Java


## Deploy da Solução

Todos os scripts necessários para provisionar os recursos estão no arquivo `scripts_azure.sh`.

### Passos utilizado para Deploy:

1. **Criar o grupo de recursos**:
   ```bash
   az group create --name MottuGroup --location brazilsouth

2. **Criar o servidor SQL e banco de dados**:
   ```bash
    az sql server create --name mottu-sql-server --resource-group MottuGroup --location brazilsouth --admin-user MottuAdmin --admin-password Michelle2006@

    az sql db create --resource-group MottuGroup --server mottu-sql-server --name mottuDB --service-objective S1

3. **Configurar firewall**:
    ```bash
    az sql server firewall-rule create --resource-group MottuGroup --server mottu-sql-server --name AllowAllIPs --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

4. **Criar o App Service Plan**:
    ```bash
    az appservice plan create --name planSites --resource-group MottuGroup --sku F1 --location brazilsouth

5. **Criar o Web App**:
    ```bash
    az webapp create --name mottu-api --resource-group MottuGroup --plan planSites --runtime "JAVA:21"

6. **Realizar o deploy da aplicação Java**:
    ```bash
    az webapp deploy --resource-group MottuGroup --name mottu-api --src-path "C:\Users\Notebook\challenge-mottu\build\libs\challenge-mottu-0.0.1-SNAPSHOT.jar"


## Conexão ao Banco de Dados

**A aplicação Java utiliza as seguintes configurações para se conectar ao banco de dados**:

    spring.datasource.url=jdbc:sqlserver://mottu-sql-server.database.windows.net:1433;databaseName=mottuDB;encrypt=true;trustServerCertificate=false;loginTimeout=30;
    spring.datasource.username=MottuAdmin
    spring.datasource.password=Michelle2006@
    spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver

-----------------------------------------------------------------------------------------------------
**Variáveis principais**:

DB_SERVER: mottu-sql-server.database.windows.net

DB_NAME: mottuDB

DB_USER: MottuAdmin

DB_PASSWORD: Michelle2006@

#### **Considerações**:
- **Gradle Build**: Para fazer o build do projeto Java com o Gradle, você pode rodar o comando:
  ```bash
  ./gradlew build


### **Para testar a API, acesse o Swagger hospedado no Azure App Service:**
https://mottu-api.azurewebsites.net/swagger-ui/swagger-ui/index.html#/



**Exemplos de requisições para testar a API estão disponíveis no arquivo ExemploJSON.md.**