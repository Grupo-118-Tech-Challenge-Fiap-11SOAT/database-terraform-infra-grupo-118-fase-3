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
  source              = "./modules/azure-sql-server"
  name                = var.server_name
  resource_group_name = module.infra_database_resource_group.name
  location            = module.infra_database_resource_group.location
  admin_login         = var.admin_login
  admin_password      = var.admin_password
}

output "sql_server_id" {
  value       = module.sql_server.id
  description = "The sql server id created by the module"
}
#endregion

#region DataBase
module "database" {
  source    = "./modules/azure-sql-database"
  name      = var.database_name
  server_id = module.sql_server.id
  sku_name  = var.sku_name
}
#endregion

#region Firewall (libera acesso do seu IP)
module "azure_sql_firewall" {
  source        = "./modules/azure-sql-firewall"
  sql_server_id = module.sql_server.id
  client_ip     = var.client_ip
}
#endregion

####MongoDb######

resource "mongodbatlas_project" "project" {
  org_id = var.atlas_org_id
  name   = var.atlas_project_name
}

## Create an Atlas cluster in Azure ##
resource "mongodbatlas_cluster" "cluster" {
  project_id = mongodbatlas_project.project.id
  name       = "products-cluster"

  cluster_type = "REPLICASET"

  # Free Tier (sempre AWS)
  provider_name                 = "TENANT"
  backing_provider_name         = "AWS"
  provider_region_name          = "US_EAST_1"
  provider_instance_size_name  = "M0"

  mongo_db_major_version = "7.0"
}

## Whitelist my current IP address ##
resource "mongodbatlas_project_ip_access_list" "allow_all" {
  project_id = mongodbatlas_project.project.id
  cidr_block = "0.0.0.0/0"
  comment    = "TEMP - DEBUG ONLY"
}

# Create a Database Password
resource "random_password" "db-user-password" {
  length = 16
  special = true
  override_special = "_%@"
}

# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username           = "adm"
  password           = random_password.db-user-password.result
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"
  
  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-db"
  }

  lifecycle {
    ignore_changes = [
      password,
    ]
  }
}