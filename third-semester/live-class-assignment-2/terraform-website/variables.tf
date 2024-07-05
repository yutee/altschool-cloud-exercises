variable "region" {
  description = "The AWS region to deploy resources."
  type = string
  default     = "us-east-1"
}

variable "bucket_name" {
    description = "Name of bucket to create. Must be globally unique."
    type = string
    default = "terraform-website-bucket10001"
}

variable "hosted_zone_id" {
  description = "The ID of the hosted zone to create records in"
  type        = string
  default = "Z030091648BF56VJS7A0"
}

variable "hosted_zone_name" {
  description = "The name of the hosted zone to create"
  type        = string
  default = "terraform-website.com"
}