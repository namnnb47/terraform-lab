
module "vpc" {
  source                      = "./modules/networking/vpc"
  vpc_cidr                    = var.vpc_cidr
}
