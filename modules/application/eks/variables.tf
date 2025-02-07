variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_groups" {
  description = "Configuration for the EKS node groups"
  type = list(object({
    name               = string
    instance_type     = string
    min_size           = number
    max_size           = number
  }))
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
  type        = list(string)
}
variable "cluster_role_arn" {

  description = "The ARN of the EKS cluster IAM role"

  type        = string

}
variable "node_group_1_name" {
  description = "Node group 1 name"
  type        = string
}

variable "node_group_2_name" {
  description = "Node group 2 name"
  type        = string
}

variable "node_role_arn" {
  description = "Node group 2 name"
  type        = string
}