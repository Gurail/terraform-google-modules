variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
  default     = "main-instance"
}

variable "database_version" {
  description = "The MySQL version to use"
  type        = string
  default     = "MYSQL_8_0"
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "machine_type" {
  description = "The machine type to use"
  type        = string
  default     = "db-f1-micro"
}

variable "database_name" {
  description = "The name of the database to create"
  type        = string
}

variable "user_name" {
  description = "The name of the user to create"
  type        = string
}

variable "user_password" {
  description = "The password for the user"
  type        = string
  sensitive   = true
} 