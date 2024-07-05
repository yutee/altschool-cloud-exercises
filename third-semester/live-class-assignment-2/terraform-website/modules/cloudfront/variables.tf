variable "s3_bucket_domain_name" {
  description = "The regional domain name of the S3 bucket"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  type = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate to use for HTTPS"
  type        = string
}