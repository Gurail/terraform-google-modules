output "instance_name" {
  description = "The name of the Cloud SQL instance"
  value       = google_sql_database_instance.mysql_instance.name
}

output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.mysql_instance.connection_name
}

output "instance_public_ip_address" {
  description = "The public IPv4 address of the Cloud SQL instance"
  value       = google_sql_database_instance.mysql_instance.public_ip_address
}

output "instance_private_ip_address" {
  description = "The private IPv4 address of the Cloud SQL instance"
  value       = google_sql_database_instance.mysql_instance.private_ip_address
}

output "database_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

output "user_name" {
  description = "The name of the database user"
  value       = google_sql_user.user.name
} 