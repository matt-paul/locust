provider "google" {
  credentials = "${file("./credentials.json")}"
  project     = "locust-load-testing-123"
  region      = "europe-west2"
}

resource "google_container_cluster" "primary" {
  name     = "locust-cluster"
  location = "europe-west2"

  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "locust-node-pool"
  location   = "europe-west2"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
