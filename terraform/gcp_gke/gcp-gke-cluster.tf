# Terraform google cloud multi tier Kubernetes deployment
# AGISIT Lab Cloud-Native Application in a Kubernetes Cluster

variable "region" {
    type = string
}

variable "project" {
    type = string
}

variable "workers_count" {
    type = number
}

locals {
  
  # Variables cluster_list and cluster_name are used for an implicit dependency
  # between module "gcloud" and resource "google_container_cluster" 
  cluster_id_parts = split("/", google_container_cluster.guestbook.id)
  cluster_name = element(local.cluster_id_parts, length(local.cluster_id_parts) - 1)
}

#####################################################################
# GKE cluster Definition
resource "google_container_cluster" "guestbook" {
  name     = "guestbook"
  project = var.project
  location = var.region
  initial_node_count = var.workers_count

  addons_config {
    network_policy_config {
      disabled = true
    }
  }

  # Definition of Cluster Nodes
  node_config {
    # Check machine types for Kubernetes Nodes in https://cloud.google.com/compute/docs/general-purpose-machines
    # n1-standard-4 has 4xvCPU, 15 GB Memory
    # n1-standard-2 has 2xvCPU, 7.5 GB Memory
    machine_type = "n1-standard-2"
    # The OAuth 2.0 scopes requested to access Google APIs,
    # depending on the level of access needed
    # Check Scopes in https://developers.google.com/identity/protocols/oauth2/scopes
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
    ]
  }


}

#####################################################################
# Output for K8S
#####################################################################
output "client_certificate" {
  value     = google_container_cluster.guestbook.master_auth.0.client_certificate
  sensitive = true
}

output "client_key" {
  value     = google_container_cluster.guestbook.master_auth.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = google_container_cluster.guestbook.master_auth.0.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value     = google_container_cluster.guestbook.endpoint
  sensitive = true
}

output "cluster" {
  value     = google_container_cluster.guestbook
  sensitive = true
}

module "gcloud" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 3.0"

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint = "gcloud"
  # Use local variable cluster_name for an implicit dependency on resource "google_container_cluster" 
  create_cmd_body = "container clusters get-credentials ${local.cluster_name} --zone=${var.region} --project=${var.project}"
}