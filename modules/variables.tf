variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "terraform-database-infra-grupo-118-fase-3"
}

variable "resource_group_location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "admin_login" {
  type        = string
  description = "SQL Server admin login"
}

variable "admin_password" {
  type        = string
  description = "SQL Server admin password"
  sensitive   = true
}

variable "client_ip" {
  type        = string
  description = "Client IP para liberar no firewall"
}