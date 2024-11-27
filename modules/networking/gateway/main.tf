resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "terraform-lab-ig"
  }
}


resource "aws_eip" "nat_eip" {
  domain    = "vpc"
  tags = {
    Name = "terraform-lab-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_1
  tags = {
    Name = "terraform-lab-nat"
  }
}