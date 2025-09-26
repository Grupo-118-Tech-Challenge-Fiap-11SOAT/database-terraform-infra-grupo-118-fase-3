terraform {
  # Configure the backend to use Terraform Cloud
  backend "remote" {
    organization = "Grupo-118-Tech-Challenge-Fiap-11SOAT"

    workspaces {
      name = "database-terraform-infra-grupo-118-fase-3"
    }
  }
}