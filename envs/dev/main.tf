provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
    }
  }
}
variable "environment" {
  description = "The environment for this infrastructure (e.g. dev, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "The name of the project"
  type        = string
  default     = "terraform-lab"
}



terraform {
  backend "s3" {
    bucket         = "terraform-lab-state-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}