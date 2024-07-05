resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for my-static-website-bucket"
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id   = "S3-bucket-website"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for my static website"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-bucket-website"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  aliases = ["utibeokon.me", "www.utibeokon.me"]

  price_class = "PriceClass_All"

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none" 
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.s3_bucket_domain_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
        }
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.s3_bucket_domain_name}/*"
      }
    ]
  })
}