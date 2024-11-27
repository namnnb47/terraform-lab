module "subnet" {
  source                      = "../../modules/networking/subnet"
  vpc_id                      = module.vpc.vpc_id
  public_subnet_cidr_1        = var.public_subnet_cidr_1
  public_subnet_cidr_2        = var.public_subnet_cidr_2
  private_subnet_cidr_1       = var.private_subnet_cidr_1
  private_subnet_cidr_2       = var.private_subnet_cidr_2
  trust_subnet_cidr_1         = var.trust_subnet_cidr_1
  trust_subnet_cidr_2         = var.trust_subnet_cidr_2
  availability_zone_1         = var.availability_zone_1
  availability_zone_2         = var.availability_zone_2
  public_subnet_1             = var.public_subnet_1
  public_subnet_2             = var.public_subnet_2
  private_subnet_1            = var.private_subnet_1
  private_subnet_2            = var.private_subnet_2
  trust_subnet_1              = var.trust_subnet_1
  trust_subnet_2              = var.trust_subnet_2
}