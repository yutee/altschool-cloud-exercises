variable "hosted_zone_name" {
  description = "The ID of the hosted zone to create records in"
  type        = string
}

variable "hosted_zone_id" {
  description = "The ID of the hosted zone to create records in"
  type        = string
}

variable "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution to create an alias record for"
  type        = string
}