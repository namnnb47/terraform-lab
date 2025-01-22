module "cloudfront" {
  source             = "../../modules/application/cloudfront"
  origin_domain_name = module.s3.bucket_website_endpoint  # Pass the S3 website endpoint
  origin_id          = "s3-origin"
  tags               = {
    Environment = "dev"
    Project     = "terraform-cdn-project"
  }
}