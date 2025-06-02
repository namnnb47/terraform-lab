variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "subnets" {
  description = "List of subnets for the ALB"
  type        = list(string)
}

variable "alb_sg" {
  description = ""
  type        = string
}