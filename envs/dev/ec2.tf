
module "ec2" {
  source                      = "../../modules/application/ec2"  
  ami                         = var.ami
  instance_type               = var.instance_type
  instance_count              = var.instance_count
  public_subnet_1_id          = module.subnet.public_subnet_1
  public_subnet_2_id          = module.subnet.public_subnet_2
  private_subnet_1_id         = module.subnet.private_subnet_1
  private_subnet_2_id         = module.subnet.private_subnet_2
  public_sg                   = module.security_group.public_sg
  private_sg                  = module.security_group.private_sg
  
}
