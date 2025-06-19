output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.this.name
}

output "cluster_location" {
  description = "The location of the GKE cluster"
  value       = google_container_cluster.this.location
}

output "cluster_endpoint" {
  description = "The IP address of the cluster master"
  value       = google_container_cluster.this.endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate"
  value       = google_container_cluster.this.master_auth.0.cluster_ca_certificate
  sensitive   = true
}

output "cluster_id" {
  description = "The unique identifier of the cluster"
  value       = google_container_cluster.this.id
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = google_container_node_pool.default_nodepool.name
}

output "node_pool_instance_group_urls" {
  description = "The instance group URLs of the node pool"
  value       = google_container_node_pool.default_nodepool.instance_group_urls
}

output "kubeconfig_raw" {
  description = "Raw kubeconfig for the GKE cluster"
  value = {
    cluster_name           = google_container_cluster.this.name
    endpoint              = google_container_cluster.this.endpoint
    cluster_ca_certificate = google_container_cluster.this.master_auth.0.cluster_ca_certificate
  }
  sensitive = true
}

output "kubernetes_cluster_host" {
  description = "The Kubernetes cluster host"
  value       = google_container_cluster.this.endpoint
  sensitive   = true
}

output "kubernetes_cluster_ca_certificate" {
  description = "The Kubernetes cluster CA certificate"
  value       = base64decode(google_container_cluster.this.master_auth.0.cluster_ca_certificate)
  sensitive   = true
}