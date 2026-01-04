variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "terraform-database-infra-grupo-118-fase-3"
}

variable "resource_group_location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "eastus2"
}

variable "server_name" {
  type        = string
  description = "SQL Server Name"
  default     = "sqlserver-grupo-118-fase-3"
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
  default     = "sqldb-grupo-118-fase-3"
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

variable "postgresql_database_name" {
  description = "PostgreSQL Database Name"
  type        = string
  default     = "pgdb-grupo-118-fase-4"
}