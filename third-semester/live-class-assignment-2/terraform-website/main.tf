terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3_bucket.s3_bucket_names
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name
  acm_certificate_arn = module.certificate.acm_certificate_arn
}

module "route53" {
  source = "./modules/route53"
  hosted_zone_name = var.hosted_zone_name
  hosted_zone_id = var.hosted_zone_id
  cloudfront_distribution_id = module.cloudfront.cloudfront_distribution_id
}

module "certificate" {
  source = "./modules/certificate"
}

resource "aws_acm_certificate" "acm_certificate" {
  domain_name = "utibeokon.me"
  validation_method = "DNS"
}

resource "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone_name
}