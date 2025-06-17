
variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
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

variable "root_password" {
  description = "The machine type to use"
  type        = string
  default     = null
}