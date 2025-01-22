module "route_table" {
  source                      = "./modules/networking/route_table"
  vpc_id                      = module.vpc.vpc_id
  igw_id                      = module.gateway.ig_id
  nat_id                      = module.gateway.nat_id
  public_subnet_1             = module.subnet.public_subnet_1
  public_subnet_2             = module.subnet.public_subnet_2
  private_subnet_1            = module.subnet.private_subnet_1
  private_subnet_2            = module.subnet.private_subnet_2

}