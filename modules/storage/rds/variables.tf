variable "allocated_storage" {
  description = "The size of the RDS instance"
  type        = number
  default     = 20
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "The password for the master username"
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the instance is publicly accessible"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "The DB subnet group to associate"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The preferred backup window"
  type        = string
  default     = "07:00-09:00"
}

variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
