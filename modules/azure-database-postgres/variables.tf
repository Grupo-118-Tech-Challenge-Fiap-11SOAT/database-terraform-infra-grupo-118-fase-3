variable "name" {
  type        = string
  description = "Database name"
}

variable "server_id" {
  type        = string
  description = "Database id"
}

variable "sku_name" {
  type        = string
  description = "Sku name"
}

variable "postgres_project_name" {
  type = string 
  description = "Project name"
}

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the container registry will be created."
  type        = string
}