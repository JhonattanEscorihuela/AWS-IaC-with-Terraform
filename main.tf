# main.tf
provider "aws" {
  region = var.aws_region
}

module "network" {
  source           = "./modules/network"
  aws_region       = var.aws_region
  allowed_ip_range = var.allowed_ip_range
}

module "network_security" {
  source           = "./modules/network_security"
  allowed_ip_range = var.allowed_ip_range
  vpc_id           = module.network.vpc_id
}

module "application" {
  source                         = "./modules/application"
  security_group_id_ssh          = module.network_security.security_group_id_ssh
  security_group_id_http_private = module.network_security.security_group_id_http_private
  public_subnet_a_id             = module.network.public_subnet_ids[0]
  public_subnet_b_id             = module.network.public_subnet_ids[1]
  security_group_id_http         = module.network_security.security_group_id_http
  vpc_id                         = module.network.vpc_id
}


