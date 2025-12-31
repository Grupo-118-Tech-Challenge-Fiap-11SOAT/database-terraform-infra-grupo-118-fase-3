variable "name" {
  type        = string
  description = "SQL Server name"
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

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the container registry will be created."
  type        = string
}