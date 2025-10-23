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


