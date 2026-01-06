resource "mongodbatlas_database_user" "db_user" {
  username           = var.admin_login
  password           = var.admin_password
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