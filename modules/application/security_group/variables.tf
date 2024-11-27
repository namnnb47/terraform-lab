variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_sg_ingress_cidr" {
  description = "The CIDR block for bastion security group ingress"
  type        = string
}
