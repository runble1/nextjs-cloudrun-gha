
output "service_account" {
  value = module.service_account.service_account_email
}

output "url" {
  value = module.cloudrun.url
}

output "artifact_registry_repository_id" {
  value = module.artifact_registry.artifact_registry_repository_id
}

output "artifact_registry_repository_name" {
  value = module.artifact_registry.artifact_registry_repository_name
}

output "google_iam_workload_identity_pool_provider_github_name" {
  value = module.service_account.google_iam_workload_identity_pool_provider_github_name
}