# resource "azurerm_postgresql_server" "postgres_db" {
#   name                = "p${var.postgres_project_name}db"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   administrator_login          = "psqladmin"
#   administrator_login_password = "H@Sh1CoR3!"

#   sku_name   = "B_Gen4_1"
#   version    = "11"
#   storage_mb = 5120

#   geo_redundant_backup_enabled = false
#   auto_grow_enabled            = false

#   public_network_access_enabled    = false
#   ssl_enforcement_enabled          = false
#   ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"
# }

# resource "azurerm_postgresql_firewall_rule" "allow_azure_services" {
#   name                = "allow_azure_services_rule_on_postgre"
#   resource_group_name = var.resource_group_name
#   server_name         = azurerm_postgresql_server.postgres_db.name
#   # This specific IP range enables the "Allow access to Azure services" feature
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "0.0.0.0"
# }

resource "azurerm_resource_group" "group118fase4postgre" {
  name     = "${var.name}-postgre"
  location = "eastus"
}


# Replace your existing azurerm_postgresql_server resource with:
resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                   = "${var.postgres_project_name}"
  resource_group_name    = azurerm_resource_group.group118fase4postgre.name
  location               = azurerm_resource_group.group118fase4postgre.location
  version                = "16"  # or "15", "14", "13", "12", "11"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  
  storage_mb   = 32768  # 32 GB
  sku_name     = "B_Standard_B1ms"  # Basic tier
  
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  
  # high_availability {
  #   mode = "Disabled"
  # }

  tags = {
    environment = "production"
    project     = "grupo-118-fase-4"
  }
}

# Replace your existing azurerm_postgresql_database resource with:
resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = "${var.postgres_project_name}-db"
  server_id = azurerm_postgresql_flexible_server.postgresql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

# Replace firewall rules with:
# resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_client" {
#   name             = "AllowClientIP"
#   server_id        = azurerm_postgresql_flexible_server.postgresql.id
#   start_ip_address = var.client_ip
#   end_ip_address   = var.client_ip
# }

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_postgresql_flexible_server.postgresql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}