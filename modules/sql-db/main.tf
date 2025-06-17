resource "google_sql_database_instance" "this" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id

  settings {
    tier              = var.machine_type
    availability_type = var.availability_type
    disk_size         = var.disk_size
    disk_type         = var.disk_type

    backup_configuration {
      enabled                        = var.backup_enabled
      binary_log_enabled            = var.binary_log_enabled
      start_time                    = var.backup_start_time
      location                      = var.backup_location
      transaction_log_retention_days = var.transaction_log_retention_days
    }

    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = var.private_network
      require_ssl                                   = var.require_ssl
      authorized_networks                           = var.authorized_networks
      allocated_ip_range                            = var.allocated_ip_range
      enable_private_path_for_google_cloud_services = var.enable_private_path
    }

    database_flags {
      name  = "max_connections"
      value = var.max_connections
    }
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql_instance.name
  project  = var.project_id
}

resource "google_sql_user" "user" {
  name     = var.user_name
  instance = google_sql_database_instance.mysql_instance.name
  password = var.user_password
  project  = var.project_id
} 