module "network" {
  source = "./network"

  location       = var.location
  resource_group = var.resource_group

  default_tags = local.common_tags
}

module "vm" {
  source = "./vm"

  location       = var.location
  resource_group = var.resource_group

  subnet_id                 = module.network.subnet_id
  network_security_group_id = module.network.security_group_id

  depends_on = [
    module.network
  ]

  default_tags = local.common_tags
}