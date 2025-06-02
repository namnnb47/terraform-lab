variable "s3_state_bucket" {
  description = "The name of the S3 bucket to store the state file"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
}

# variable "s3_state_key" {
#   description = "The path to the state file inside the S3 bucket"
#   type        = string
# }

variable "region" {
  description = "The AWS region for the S3 bucket and DynamoDB table"
  type        = string
  default     = "us-east-1"
}
