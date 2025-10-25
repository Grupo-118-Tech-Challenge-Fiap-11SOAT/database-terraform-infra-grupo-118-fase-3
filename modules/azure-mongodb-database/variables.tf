variable "name" {
  type        = string
  description = "Database name"
}

variable "cosmosdb_account_name" {
  type        = string
  description = "CosmosDbAccount name"
}

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
  type        = string
}


