variable "repository_id" {}
variable "service_account_email" {}

resource "google_artifact_registry_repository" "registry" {
  location      = "asia-northeast1"
  repository_id = var.repository_id
  description   = "nextjs docker repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "member" {
  project    = google_artifact_registry_repository.registry.project
  location   = google_artifact_registry_repository.registry.location
  repository = google_artifact_registry_repository.registry.name
  #role = "roles/artifactregistry.repoAdmin"
  role   = "roles/artifactregistry.writer" #デバッグ
  member = "serviceAccount:${var.service_account_email}"
}