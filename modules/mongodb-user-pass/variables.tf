variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
  # default     = "products"
}

variable "project_id" {
  type = string
} 

variable "admin_login" {
  type        = string
  description = "MongoDB admin login"
}

variable "admin_password" {
  type        = string
  description = "MongoDB admin password"
  sensitive   = true
}