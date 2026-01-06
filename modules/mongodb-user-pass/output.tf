output "mongodb_user_login" {
  value = var.admin_login
}

output "mongodb_user_password" {
  value     = var.admin_password
  sensitive = true
}