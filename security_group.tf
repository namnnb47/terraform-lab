
# get my ip
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com/"
}

locals {
  my_ip = chomp(data.http.my_ip.body)
}

module "security_group" {
  source = "./modules/compute/security_group"
  vpc_id                  = module.vpc.vpc_id
  public_sg_ingress_cidr = "${local.my_ip}/32"  # Replace with your IP address for SSH access
}