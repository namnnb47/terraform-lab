variable "origin_domain_name" {
  description = "The domain name of the origin (e.g., S3 bucket website endpoint)"
  type        = string
}

variable "origin_id" {
  description = "The origin ID"
  type        = string
}

variable "tags" {
  description = "Tags for the CloudFront distribution"
  type        = map(string)
  default     = {}
}
