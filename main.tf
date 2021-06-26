module "vultr" {
  source        = "./modules/vultr"
  vultr_api_key = var.vultr_api_key
  vultr_region  = "mia"
  users         = var.users
}
