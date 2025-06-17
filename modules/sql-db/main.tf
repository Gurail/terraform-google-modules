resource "google_sql_database_instance" "this" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = var.machine_type

    # ip_configuration {
    #   dynamic "authorized_networks" {
    #     for_each = var.ip_configuration.authorized_networks
    #     iterator = ip

    #     content {
    #       name  = ip.value.name
    #       value = ip.value
    #     }
    #   }
    # }
  }
}