resource "azurerm_mssql_firewall_rule" "sql_fw" {
  name             = "AllowClientIP"
  server_id        = var.sql_server_id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}