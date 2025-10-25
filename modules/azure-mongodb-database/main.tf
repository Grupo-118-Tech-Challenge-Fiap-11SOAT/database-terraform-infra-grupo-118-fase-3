resource "azurerm_cosmosdb_mongo_database" "db" {
  name                = var.name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = 400
}