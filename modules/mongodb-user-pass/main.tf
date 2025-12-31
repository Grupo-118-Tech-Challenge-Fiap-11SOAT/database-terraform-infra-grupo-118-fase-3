resource "random_password" "db_user_password" {
  length  = 16
  special = true
  override_special = "_%@"
}

resource "mongodbatlas_database_user" "db_user" {
  username           = "adm"
  password           = random_password.db_user_password.result
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-db"
  }

  lifecycle {
    ignore_changes = [password]
  }
}