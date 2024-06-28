resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "private_bucket" {
  bucket = aws_s3_bucket.website.id


}

// for individual files
resource "aws_s3_bucket_object" "object" {
  bucket = "your_bucket_name"
  key    = "new_object_key"
  source = "/Users/yutee/Desktop/Alt___School/second-third-semester/altschool-cloud-exercises/third-semester/live-class-assignment-2/terraform/modules/s3_bucket/static-website"
  etag = filemd5("/Users/yutee/Desktop/Alt___School/second-third-semester/altschool-cloud-exercises/third-semester/live-class-assignment-2/terraform/modules/s3_bucket/static-website")
  // content_type = "text/html"
}