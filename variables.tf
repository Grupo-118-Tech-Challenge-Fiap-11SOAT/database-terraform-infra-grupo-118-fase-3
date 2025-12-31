variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "terraform-sqlserver-database-infra-grupo-118-fase-4"
}

variable "resource_group_location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "eastus2"
}

variable "server_name" {
  type        = string
  description = "SQL Server Name"
  default     = "sqlserver-grupo-118-fase-4"
}

variable "admin_login" {
  type      = string
  sensitive = true
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type        = string
  description = "DataBase Name"
  default     = "sqldb-grupo-118-fase-4"
}

variable "sku_name" {
  type        = string
  description = "Sku Name"
  default     = "S0"
}

variable "client_ip" {
  type        = string
  description = "Client IP para liberar no firewall"
}

## Atlas Organization ID ##
variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
  default     = ""
}

variable "mongodb_atlas_public_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_private_key" {
  type      = string
  sensitive = true
}
