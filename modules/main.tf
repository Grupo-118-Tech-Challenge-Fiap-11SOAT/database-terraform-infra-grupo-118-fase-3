# Resource Group
resource "azurerm_resource_group" "group118fase3infrarg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


# Servidor lógico SQL
resource "azurerm_mssql_server" "sql_server" {
  name                         = "sqlserver-grupo-118-fase-3"
  resource_group_name          = azurerm_resource_group.group118fase3infrarg.name
  location                     = azurerm_resource_group.group118fase3infrarg.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
}

# Banco de dados
resource "azurerm_mssql_database" "sql_db" {
  name           = "sqldb-grupo-118-fase-3"
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = "S0"
}

# Firewall (libera acesso do seu IP)
resource "azurerm_mssql_firewall_rule" "sql_fw" {
  name             = "AllowClientIP"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}