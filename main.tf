#region Resource Group
module "infra_database_resource_group" {
  source   = "./modules/azure-resource-group"
  name     = var.resource_group_name
  location = var.resource_group_location
}

output "infra_database_resource_group_name" {
  value       = module.infra_database_resource_group.name
  description = "The name of the resource group created by the module"
}

output "infra_database_resource_group_location" {
  value       = module.infra_database_resource_group.location
  description = "The location of the resource group created by the module"
}
#endregion

#region SQL Server
module "sql_server" {
  source   = "./modules/azure-server"
  name = var.server_name
  resource_group_name = module.infra_database_resource_group.name
  location = module.infra_database_resource_group.location
  admin_login  = ""
  admin_password = ""
}

output "sql_server_id" {
  value       = module.sql_server.id
  description = "The sql server id created by the module"
}
#endregion

#region DataBase
module "database" {
  source = "./modules/azure-database"
  name = var.database_name
  server_id = module.sql_server.id
  sku_name = var.sku_name
}
#endregion

# Firewall (libera acesso do seu IP)
module "azure_sql_firewall" {
  source = "./modules/azure-sql-firewall"
  sql_server_id = module.sql_server.id
  client_ip = "177.189.167.171"
}
#endregion