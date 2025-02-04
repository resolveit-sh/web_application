module "network" {
  source = "./modules/tf-yc-network"
}

module "vm" {
  source       = "./modules/tf-yc-instance"
  network_zone = module.network.network_zone
  subnet_id    = module.network.subnet_id
}