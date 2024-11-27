variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "The CIDR block for the second private subnet"
  type        = string
}

variable "trust_subnet_cidr_1" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "trust_subnet_cidr_2" {
  description = "The CIDR block for the second private subnet"
  type        = string
}

variable "availability_zone_1" {
  description = "The availability zone for the first subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "The availability zone for the second subnet"
  type        = string
}

variable "public_subnet_1" {
  description = "The subnet name for the first public subnet"
  type        = string
}

variable "public_subnet_2" {
  description = "The subnet name for the second public subnet"
  type        = string
}

variable "private_subnet_1" {
  description = "The subnet name for the first private subnet"
  type        = string
}

variable "private_subnet_2" {
  description = "The subnet name for the second private subnet"
  type        = string
}

variable "trust_subnet_1" {
  description = "The subnet name for the first trust subnet"
  type        = string
}

variable "trust_subnet_2" {
  description = "The subnet name for the second trust subnet"
  type        = string
}