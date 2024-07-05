data "aws_route53_zone" "hosted_zone" {
  # name = var.hosted_zone_name
  zone_id = var.hosted_zone_id
}

data "aws_cloudfront_distribution" "my_distribution" {
  id = var.cloudfront_distribution_id
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "www"
  type    = "A"

  alias {
    name                   = data.aws_cloudfront_distribution.my_distribution.domain_name #get from cloudfront module
    zone_id                = data.aws_cloudfront_distribution.my_distribution.hosted_zone_id #get from cloudfront module
    evaluate_target_health = false
  }
}