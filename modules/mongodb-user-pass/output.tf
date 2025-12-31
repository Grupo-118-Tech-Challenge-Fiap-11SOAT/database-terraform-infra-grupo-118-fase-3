output "mongodb_user_password" {
  value     = random_password.db_user_password.result
  sensitive = true
}