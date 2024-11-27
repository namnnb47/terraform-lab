resource "aws_subnet" "public_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_1
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_1
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_2
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = var.private_subnet_1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = var.private_subnet_2
  }
}

# Subnet 1 for RDS
resource "aws_subnet" "trust_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.trust_subnet_cidr_1
  availability_zone = var.availability_zone_1
  
  tags = {
    Name = var.trust_subnet_1
  }
}

# Subnet 2 for RDS
resource "aws_subnet" "trust_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.trust_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = var.trust_subnet_2
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "terraform-trust-subnet-group"
  subnet_ids = [aws_subnet.trust_subnet_1.id, aws_subnet.trust_subnet_2.id]

  tags = {
    Name = "RDS Subnet Group"
  }
}
