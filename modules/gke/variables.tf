variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region to deploy the cluster"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "The VPC network to deploy the cluster"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "The subnetwork to deploy the cluster"
  type        = string
  default     = ""
}

variable "pods_range_name" {
  description = "The name of the secondary range for pods"
  type        = string
  default     = "pods"
}

variable "services_range_name" {
  description = "The name of the secondary range for services"
  type        = string
  default     = "services"
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "The disk size for the nodes in GB"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "The disk type for the nodes"
  type        = string
  default     = "pd-standard"
}

variable "preemptible" {
  description = "Whether to use preemptible nodes"
  type        = bool
  default     = false
}

variable "service_account" {
  description = "The service account for the nodes"
  type        = string
  default     = null
}

variable "node_labels" {
  description = "Labels to apply to the nodes"
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  description = "Tags to apply to the nodes"
  type        = list(string)
  default     = []
}

variable "enable_autoscaling" {
  description = "Whether to enable autoscaling"
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "The minimum number of nodes in the pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "The maximum number of nodes in the pool"
  type        = number
  default     = 3
}

variable "auto_repair" {
  description = "Whether to enable auto repair"
  type        = bool
  default     = true
}

variable "auto_upgrade" {
  description = "Whether to enable auto upgrade"
  type        = bool
  default     = true
}

variable "enable_private_cluster" {
  description = "Whether to enable private cluster"
  type        = bool
  default     = false
}

variable "enable_private_endpoint" {
  description = "Whether to enable private endpoint"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The IP range for the Kubernetes master"
  type        = string
  default     = "172.16.0.0/28"
}

variable "network_policy_enabled" {
  description = "Whether to enable network policy"
  type        = bool
  default     = false
}

variable "http_load_balancing" {
  description = "Whether to enable HTTP load balancing addon"
  type        = bool
  default     = true
}

variable "horizontal_pod_autoscaling" {
  description = "Whether to enable horizontal pod autoscaling addon"
  type        = bool
  default     = true
}

variable "authorized_networks" {
  description = "List of authorized networks for master access"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = null
}