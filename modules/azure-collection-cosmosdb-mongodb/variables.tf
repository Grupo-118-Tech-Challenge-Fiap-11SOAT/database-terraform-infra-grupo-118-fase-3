variable "name" {
  type        = string
  description = "Collection name"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "account_name" {
  description = "Account name."
  type        = string
}

variable "database_name" {
  description = "Database name."
  type        = string
}

variable "throughput" {
  description = "number of throughput."
  type        = number
}

