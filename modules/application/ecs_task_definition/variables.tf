variable "region" {
  description = "region"
  type        = string
}

variable "family" {
  description = "Family of the ECS task definition"
  type        = string
}

variable "cpu" {
  description = "The number of CPU units reserved for the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) reserved for the task"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the IAM role that the Amazon ECS container agent and the Docker daemon use to pull container images and publish container logs"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Docker container image to use for the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "log_group_name" {
  description = "CloudWatch log group name for the container logs"
  type        = string
  default     = "default-log-group"
}

variable "log_stream_prefix" {
  description = "Prefix for CloudWatch log streams"
  type        = string
  default     = "default-prefix"
}


