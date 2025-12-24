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

variable "resource_group_name_mongo_bd" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "terraform-mongodb-database-infra-grupo-118-fase-4"
}

variable "cosmosdb_name" {
  description = "The name of cosmosdb will be created"
  type        = string
  default     = "mongoaccountdemo"
}

variable "database_name_mongodb" {
  description = "Database name MongoDb"
  type        = string
  default     = "products-db"
}

## Atlas Organization ID ##
variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
  default     = ""
}

## Atlas Project Name ##
variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
  default     = "products"
}

## Atlas Azure Region ##
variable "atlas_azure_region" {
  description = "Azure region for the MongoDB Atlas cluster"
  type        = string
  default     = "EUROPE_WEST"
}

## Atlas Cluster Name ##
variable "atlas_cluster_name" {
  description = "MongoDB Atlas cluster name"
  type        = string
  default     = "kopi-cluster"
}

## Atlas Cluster Size ##
variable "atlas_cluster_instance_size" {
  description = "MongoDB Atlas cluster instance size"
  type        = string
  default     = "M0"
}

## Atlas Cluster Version ##
variable "atlas_cluster_version" {
  description = "MongoDB version"
  type        = string
  default     = "8.0"
}

## Atlas Cluster Backup ##
variable "atlas_cluster_backup" {
  description = "MongoDB Atlas cluster backup"
  type        = bool
  default     = false
}