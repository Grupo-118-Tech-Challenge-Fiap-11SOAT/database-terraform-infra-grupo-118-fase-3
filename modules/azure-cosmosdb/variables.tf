variable "name" {
  type        = string
  description = "CosmosDbAccount name"
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
  type        = string
}

variable "offer_type" {
  description = "Offer Type."
  type        = string
}

variable "kind" {
  description = "kind used on CosmosDB."
  type        = string
}

variable "capabilities_name" {
  description = "Name of capabilities."
  type        = string
}

