variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "ECS Cluster ID"
  type        = string
}

variable "task_definition_arn" {
  description = "Task definition ARN"
  type        = string
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
}

variable "subnets" {
  description = "List of subnets for the ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Port for the container"
  type        = number
}

# variable "listener" {
#   description = "Name of the container"
#   type        = string
# }
