resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_config" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "template_files" {
    source = "hashicorp/dir/template"
    base_dir = "${path.module}/website" # https://registry.terraform.io/modules/hashicorp/dir/template/latest
}

resource "aws_s3_object" "bucket_files" {
  bucket =  aws_s3_bucket.s3_bucket.bucket

  for_each = module.template_files.files
  key = each.key
  content_type = each.value.content_type
  source = each.value.source_path
  content = each.value.content
  etag = each.value.digests.md5
}