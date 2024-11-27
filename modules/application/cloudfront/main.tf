resource "aws_cloudfront_distribution" "cloudfront-cdn" {
  origin {
    domain_name = var.origin_domain_name  # This line should use the correct variable
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = ""  # Adjust if using Origin Access Identity
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = var.tags
}


