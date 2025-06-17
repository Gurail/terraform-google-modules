variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

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

variable "availability_type" {
  description = "The availability type of the instance"
  type        = string
  default     = "ZONAL"
}

variable "disk_size" {
  description = "The disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type to use"
  type        = string
  default     = "PD_SSD"
}

variable "backup_enabled" {
  description = "Whether backup is enabled"
  type        = bool
  default     = true
}

variable "binary_log_enabled" {
  description = "Whether binary log is enabled"
  type        = bool
  default     = true
}

variable "backup_start_time" {
  description = "The start time of the backup window"
  type        = string
  default     = "02:00"
}

variable "backup_location" {
  description = "The location of the backup"
  type        = string
  default     = null
}

variable "transaction_log_retention_days" {
  description = "The number of days to retain transaction logs"
  type        = number
  default     = 7
}

variable "ipv4_enabled" {
  description = "Whether IPv4 is enabled"
  type        = bool
  default     = true
}

variable "private_network" {
  description = "The private network to connect to"
  type        = string
  default     = null
}

variable "require_ssl" {
  description = "Whether SSL is required"
  type        = bool
  default     = true
}

variable "authorized_networks" {
  description = "The authorized networks to connect to"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "allocated_ip_range" {
  description = "The allocated IP range"
  type        = string
  default     = null
}

variable "enable_private_path" {
  description = "Whether to enable private path for Google Cloud services"
  type        = bool
  default     = false
}

variable "max_connections" {
  description = "The maximum number of connections"
  type        = string
  default     = "100"
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = true
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