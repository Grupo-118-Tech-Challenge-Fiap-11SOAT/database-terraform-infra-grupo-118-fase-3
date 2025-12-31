resource "azurerm_mssql_database" "sql_db" {
  name           = var.name
  server_id      = var.server_id
  sku_name       = var.sku_name
}