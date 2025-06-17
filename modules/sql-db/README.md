# GCP MySQL Cloud SQL Module

This Terraform module creates a Google Cloud SQL MySQL instance with configurable settings for high availability, backup, and security.

## Features

- MySQL instance creation with configurable version
- Automatic backups and binary logging
- Configurable machine type and disk settings
- Network configuration with private/public IP options
- Database and user creation
- SSL support
- High availability options

## Usage

```hcl
module "mysql" {
  source = "path/to/module"

  project_id         = "your-project-id"
  instance_name      = "mysql-instance"
  database_version   = "MYSQL_8_0"
  region            = "us-central1"
  machine_type      = "db-f1-micro"
  disk_size         = 10
  database_name     = "mydatabase"
  user_name         = "myuser"
  user_password     = "mypassword"

  # Optional configurations
  availability_type = "ZONAL"
  backup_enabled    = true
  require_ssl       = true
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| google | >= 4.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The project ID to deploy to | `string` | n/a | yes |
| instance_name | The name of the Cloud SQL instance | `string` | n/a | yes |
| database_version | The MySQL version to use | `string` | `"MYSQL_8_0"` | no |
| region | The region to deploy to | `string` | `"us-central1"` | no |
| machine_type | The machine type to use | `string` | `"db-f1-micro"` | no |
| availability_type | The availability type of the instance | `string` | `"ZONAL"` | no |
| disk_size | The disk size in GB | `number` | `10` | no |
| disk_type | The disk type to use | `string` | `"PD_SSD"` | no |
| backup_enabled | Whether backup is enabled | `bool` | `true` | no |
| binary_log_enabled | Whether binary log is enabled | `bool` | `true` | no |
| backup_start_time | The start time of the backup window | `string` | `"02:00"` | no |
| backup_location | The location of the backup | `string` | `null` | no |
| transaction_log_retention_days | The number of days to retain transaction logs | `number` | `7` | no |
| ipv4_enabled | Whether IPv4 is enabled | `bool` | `true` | no |
| private_network | The private network to connect to | `string` | `null` | no |
| require_ssl | Whether SSL is required | `bool` | `true` | no |
| authorized_networks | The authorized networks to connect to | `list(object)` | `[]` | no |
| allocated_ip_range | The allocated IP range | `string` | `null` | no |
| enable_private_path | Whether to enable private path for Google Cloud services | `bool` | `false` | no |
| max_connections | The maximum number of connections | `string` | `"100"` | no |
| deletion_protection | Whether deletion protection is enabled | `bool` | `true` | no |
| database_name | The name of the database to create | `string` | n/a | yes |
| user_name | The name of the user to create | `string` | n/a | yes |
| user_password | The password for the user | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance_name | The name of the Cloud SQL instance |
| instance_connection_name | The connection name of the Cloud SQL instance |
| instance_public_ip_address | The public IPv4 address of the Cloud SQL instance |
| instance_private_ip_address | The private IPv4 address of the Cloud SQL instance |
| database_name | The name of the database |
| user_name | The name of the database user |

## Security Considerations

- Always use strong passwords for database users
- Enable SSL for secure connections
- Use private networks when possible
- Configure authorized networks carefully
- Enable deletion protection for production instances

## License

MIT Licensed. See LICENSE for full details.