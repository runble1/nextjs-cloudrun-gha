variable "service_account_email" {}

variable "location" {
  description = "A location of a cloud run instance"
  type        = string
  default     = "asia-northeast1"
}

variable "container_image" {
  description = "docker container image"
  type        = string
  default     = "gcr.io/cloudrun/hello"
}

resource "google_cloud_run_service" "default" {
  name                       = "cloudrun-hello"
  location                   = var.location
  autogenerate_revision_name = true
  template {
    spec {
      containers {
        image = var.container_image
      }
      service_account_name = var.service_account_email
    }
  }
}

data "google_iam_policy" "cloud_run_public" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "policy" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.cloud_run_public.policy_data
}