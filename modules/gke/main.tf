resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  initial_node_count       = 0

  network    = var.network
  subnetwork = var.subnetwork

  # Enable network policy if specified
  network_policy {
    enabled = var.network_policy_enabled
  }

  # Configure master authorized networks
  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_networks != null ? [var.authorized_networks] : []
    content {
      dynamic "cidr_blocks" {
        for_each = master_authorized_networks_config.value
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }

  # Enable private cluster if specified
  dynamic "private_cluster_config" {
    for_each = var.enable_private_cluster ? [1] : []
    content {
      enable_private_nodes    = true
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }

  # Enable workload identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  # Disable legacy ABAC
  enable_legacy_abac = false

  # Configure logging and monitoring
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  # Configure addons
  addons_config {
    http_load_balancing {
      disabled = !var.http_load_balancing
    }
    horizontal_pod_autoscaling {
      disabled = !var.horizontal_pod_autoscaling
    }
    network_policy_config {
      disabled = !var.network_policy_enabled
    }
  }
}

resource "google_container_node_pool" "default_nodepool" {
  name       = "default-pool"
  location   = var.region
  cluster    = google_container_cluster.this.name
  node_count = var.node_count
  
  queued_provisioning {
    enabled = false
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    spot                        = true
    advanced_machine_features {
      enable_nested_virtualization = false
      threads_per_core             = 0
    }
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes = [
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/trace.append"
    ]

    labels = var.node_labels
    tags   = var.node_tags

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  # Configure autoscaling if enabled
  dynamic "autoscaling" {
    for_each = var.enable_autoscaling ? [1] : []
    content {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }
  }

  # Configure node management
  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
}