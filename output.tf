output "mongodb_user_password" {
  value     = random_password.db-user-password.result
  sensitive = true
}