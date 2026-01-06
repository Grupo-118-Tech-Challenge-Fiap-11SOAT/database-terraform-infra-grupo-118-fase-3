resource "mongodbatlas_project" "project" {
  org_id = var.atlas_org_id
  name   = var.atlas_project_name
}

resource "mongodbatlas_cluster" "cluster" {
  project_id = mongodbatlas_project.project.id
  name       = var.cluster_name

  cluster_type = "REPLICASET"

  provider_name                 = "TENANT"
  backing_provider_name         = "AWS"
  provider_region_name          = "US_EAST_1"
  provider_instance_size_name  = "M0"

  mongo_db_major_version = "7.0"
}

resource "mongodbatlas_project_ip_access_list" "allow_all" {
  project_id = mongodbatlas_project.project.id
  cidr_block = "0.0.0.0/0"
  comment    = "TEMP - DEBUG ONLY"
}