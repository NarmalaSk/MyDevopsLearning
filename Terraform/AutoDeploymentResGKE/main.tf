terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  # Cluster version (latest will pick current available version)
  min_master_version = "latest"

  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pool {
    name       = "default-pool"
    node_count = 1

    autoscaling {
      min_node_count = 1
      max_node_count = 3
    }

    node_config {
      machine_type = "e2-standard-4"
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}

