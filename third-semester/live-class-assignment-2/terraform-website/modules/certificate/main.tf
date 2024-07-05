resource "aws_acm_certificate" "acm_certificate" {
  domain_name = "utibeokon.me"
  validation_method = "DNS"
}

