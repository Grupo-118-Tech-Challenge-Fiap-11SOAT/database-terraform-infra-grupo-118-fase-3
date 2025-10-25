resource "azurerm_cosmosdb_mongo_collection" "collection" {
  name                = var.name
  resource_group_name = var.resource_group_name
  account_name        = var.account_name
  database_name       = var.database_name
  throughput          = var.throughput

  index {
    keys   = ["_id"]
    unique = true
  }
}
