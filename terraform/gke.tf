resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.main.self_link
  subnetwork = google_compute_subnetwork.main.self_link
}

resource "google_container_node_pool" "regular_pool" {
  name     = "regular-pool"
  location = var.zone
  cluster  = google_container_cluster.primary.name

  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    machine_type = "e2-standard-4"

    disk_type    = "pd-standard"
    disk_size_gb = 50

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      workload = "stateful"
    }
  }
}


resource "google_container_node_pool" "spot_pool" {

  name     = "spot-pool"
  location = var.zone
  cluster  = google_container_cluster.primary.name

  autoscaling {
    min_node_count = 0
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    machine_type = "e2-standard-2"

    disk_type    = "pd-standard"
    disk_size_gb = 50
    spot         = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      workload = "stateless"
    }
  }
}
