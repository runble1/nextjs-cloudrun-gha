variable "project_id" {}
variable "repo_name" {}

locals {
  cloudrun_roles = [
    "roles/run.developer",
    "roles/iam.serviceAccountUser"
  ]
}

resource "google_service_account" "github_actions" {
  account_id   = "github-actions1"
  display_name = "A service account for GitHub Actions"
  description  = "link to Workload Identity Pool used by github actions"
}

resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github-actions1"
  display_name              = "For Github Actions"
  description               = "Workload Identity Pool for GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_provider_id = "github-actions-provider1"
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id

  display_name = "For Github Actions Provider"
  description  = "OIDC identity pool provider for execute github actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.owner"      = "assertion.repository_owner"
    "attribute.refs"       = "assertion.ref"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "github-account-iam" {
  service_account_id = google_service_account.github_actions.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.repo_name}"
}

resource "google_project_iam_member" "service_account" {
  count   = length(local.cloudrun_roles)
  project = var.project_id
  role    = element(local.cloudrun_roles, count.index)
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}
