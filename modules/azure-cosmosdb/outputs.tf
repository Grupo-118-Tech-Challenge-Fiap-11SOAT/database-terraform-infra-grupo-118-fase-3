output "name" {
  value = azurerm_cosmosdb_account.cosmosdb_account.name
  description = "The name of the cosmosdb account"
}

output "endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
}

output "connection_strings" {
  value = azurerm_cosmosdb_account.moncosmosdb_account.connection_strings[0]
  sensitive = true
}