module "service_account" {
  source = "./modules/service_account"
  project_id = var.project_id
}

module "registry" {
  source     = "./modules/container_registry"
  depends_on = [module.service_account]
  project_id = var.project_id
  service_account_email = module.service_account.service_account_email
}

module "cloudrun" {
  source     = "./modules/cloudrun"
  depends_on = [module.service_account, module.registry]
  #container_image = module.registry.container_registry_id
  service_account_email = module.service_account.service_account_email
}