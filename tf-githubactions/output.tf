
output "service_account" {
  value = module.service_account.service_account_email
}

output "url" {
  value = module.cloudrun.url
}

output "container_registry" {
  value = module.registry.container_registry_id
}

output "google_iam_workload_identity_pool_provider_github_name" {
  value = module.service_account.google_iam_workload_identity_pool_provider_github_name
}