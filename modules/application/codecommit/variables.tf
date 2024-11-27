variable "repository_name" {
  type        = string
  description = "The name of the CodeCommit repository"
}

variable "repository_description" {
  type        = string
  description = "The description of the CodeCommit repository"
  default     = "CodeCommit repository for Terraform project"
}
