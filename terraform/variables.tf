variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "asia-south1-a"
}

variable "cluster_name" {
  description = "cluster name"
  type        = string
  default     = "mario-gke"
}
