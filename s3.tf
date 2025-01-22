module "s3" {
  source        = "../../modules/application/s3"
  bucket_name   = "terraform-dev-s3-bucket-cdn"
  index_document = "index.html"
  error_document = "error.html"
  tags          = {
    Environment = "dev"
    Project     = "terraform-dev-cdn"
  }
}