variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "index_document" {
  description = "Index document for the website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the website"
  type        = string
  default     = "error.html"
}

variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {}
}
