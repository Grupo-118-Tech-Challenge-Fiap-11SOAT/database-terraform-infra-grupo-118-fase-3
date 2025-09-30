resource "azurerm_mssql_firewall_rule" "sql_fw_internal_service" {
  name             = "AllowInternalAzureServices"
  server_id        = var.sql_server_id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "sql_fw_external_address" {
  name             = "AllowClientIP"
  server_id        = var.sql_server_id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}