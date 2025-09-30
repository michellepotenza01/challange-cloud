# Script para Provisionamento e Deploy de Recursos no Azure usando Azure CLI.Este script cria os recursos necessários para rodar a aplicação MottuAPI no Microsoft Azure, incluindo um grupo de recursos, servidor SQL, banco de dados, App Service e deploy da aplicação.

# Definindo variáveis principais
DB_SERVER="mottu-sql-server.database.windows.net"
DB_NAME="mottuDB"
DB_USER="MottuAdmin"
DB_PASSWORD="Michelle2006@"
APP_NAME="mottu-api"
GROUP_NAME="MottuGroup"

# 1. Criar o grupo de recursos
az group create --name $GROUP_NAME --location brazilsouth

# 2. Criar o servidor SQL
az sql server create --name $DB_SERVER --resource-group $GROUP_NAME --location brazilsouth --admin-user $DB_USER --admin-password $DB_PASSWORD

# 3. Criar o banco de dados
az sql db create --resource-group $GROUP_NAME --server $DB_SERVER --name $DB_NAME --service-objective S1

# 4. Obter a string de conexão do banco de dados
az sql db show-connection-string --client ado.net --name $DB_NAME --server $DB_SERVER

# 5. Criar o App Service Plan
az appservice plan create --name planSites --resource-group $GROUP_NAME --sku F1 --location brazilsouth

# 6. Criar o Web App para Java 21
az webapp create --name $APP_NAME --resource-group $GROUP_NAME --plan planSites --runtime "JAVA:21"

# 7. Criar a regra de firewall com acesso total
az sql server firewall-rule create --resource-group $GROUP_NAME --server $DB_SERVER --name AllowAllIPs --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

# 8. Realizar o deploy da aplicação Java (arquivo JAR)
az webapp deploy --resource-group $GROUP_NAME --name $APP_NAME --src-path "C:\Users\Notebook\challenge-mottu\build\libs\challenge-mottu-0.0.1-SNAPSHOT.jar"



