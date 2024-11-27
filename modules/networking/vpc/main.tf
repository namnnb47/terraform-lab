resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support   = true    # Enable DNS resolution
  enable_dns_hostnames = true    # Enable DNS hostnames

  tags = {
    Name = "terraform-lab-vpc"
  }
}
