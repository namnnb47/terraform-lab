variable "cluster_name" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "node_group_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "instance_type" {
  type = string
}
