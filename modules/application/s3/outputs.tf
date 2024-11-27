output "bucket_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  value       = aws_s3_bucket.s3-cdn.bucket_regional_domain_name
}


output "s3_bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3-cdn.id
}


