resource "aws_s3_bucket" "s3-cdn" {
  bucket = var.bucket_name
  tags = var.tags
}
resource "aws_s3_bucket_website_configuration" "s3-cdn-configure" {
  bucket = aws_s3_bucket.s3-cdn.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3_cdn_public_access_block" {
  bucket = aws_s3_bucket.s3-cdn.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_cloudfront_origin_access_identity" "my_oai" {
  comment = "OAI for my S3 bucket"
}

resource "aws_s3_bucket_policy" "s3_cdn_policy" {
  bucket = aws_s3_bucket.s3-cdn.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudFrontAccess",
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.my_oai.iam_arn
        },
        Action    = [
          "s3:GetObject"
        ],
        Resource  = [
          "${aws_s3_bucket.s3-cdn.arn}/*"
        ]
      }
    ]
  })
}



