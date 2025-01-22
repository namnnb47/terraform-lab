module "gateway" {
  source                      = "../../modules/networking/gateway"
  vpc_id                      = module.vpc.vpc_id
  public_subnet_1             = module.subnet.public_subnet_1
}