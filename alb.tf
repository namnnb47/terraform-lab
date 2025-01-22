module "alb" {
  source          = "./modules/application/alb"
  vpc_id          = module.vpc.vpc_id
  subnets         = [module.subnet.public_subnet_1, module.subnet.public_subnet_2]
  alb_sg           = module.security_group.alb_sg  # Pass the security group ID
}
