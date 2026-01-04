output "fqdn" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "user" {
  value = azurerm_postgresql_flexible_server.postgresql.administrator_login
}

output "name" {
  value = azurerm_postgresql_flexible_server_database.database.name
}

output "password" {
  value = azurerm_postgresql_flexible_server.postgresql.administrator_password
}
