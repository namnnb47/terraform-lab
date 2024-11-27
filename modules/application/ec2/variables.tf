variable "ami" {
  description = "The AMI to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
  default     = 2
}

variable "public_subnet_1_id" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "public_subnet_2_id" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "private_subnet_1_id" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "private_subnet_2_id" {
  description = "The subnet ID where the instances will be created"
  type        = string
}
variable "public_sg" {
  description = ""
  type        = string
}

variable "private_sg" {
  description = ""
  type        = string
}