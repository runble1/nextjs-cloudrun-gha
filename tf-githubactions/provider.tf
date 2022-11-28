provider "google" {
  project     = var.project_id
  zone        = "us-central1-c"
}

provider "google-beta" {
  project     = var.project_id
  region      = "us-central1"
}