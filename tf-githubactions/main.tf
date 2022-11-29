module "service_account" {
  source     = "./modules/service_account"
  project_id = var.project_id
  repo_name  = var.repo_name
}

module "artifact_registry" {
  source                = "./modules/artifact_registry"
  depends_on            = [module.service_account]
  repository_id         = "nextjs-docker"
  service_account_email = module.service_account.service_account_email
}

module "cloudrun" {
  source     = "./modules/cloudrun"
  depends_on = [module.service_account, module.artifact_registry]
  #container_image = module.registry.container_registry_id
  service_account_email = module.service_account.service_account_email
}