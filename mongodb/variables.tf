variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "terraform-mongodb-database-infra-grupo-118-fase-4"
}

variable "resource_group_location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "eastus2"
}

variable "cosmosdb_name" {
  description = "The name of cosmosdb will be created"
  type        = string
  default     = "mongoaccountdemo"
}

variable "database_name" {
  description = "Database name MongoDb"
  type        = string
  default     = "products-db"
}


