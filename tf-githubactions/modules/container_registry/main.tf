variable "project_id" {
  type = string
}

variable "service_account_email" {
  type = string
}

resource "google_container_registry" "registry" {
  project  = var.project_id
  location = "ASIA"
}

resource "google_storage_bucket_iam_member" "registry_create" {
  bucket = google_container_registry.registry.id
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service_account_email}"
}
