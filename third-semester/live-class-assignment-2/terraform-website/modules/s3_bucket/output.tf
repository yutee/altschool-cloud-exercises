output "s3_bucket_names" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}