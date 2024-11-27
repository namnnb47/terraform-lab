variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_id" {
description = "The ID of the IG"
  type        = string
}

variable "nat_id" {
description = "The ID of the NAT"
  type        = string
}

variable "public_subnet_1" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_2" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "private_subnet_1" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_2" {
  description = "The CIDR block for the first private subnet"
  type        = string
}