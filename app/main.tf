resource "aws_s3_bucket" "example_bucket" {
  bucket_prefix = var.bucket_prefix
  # name property

  tags = {
    Prefix        = var.bucket_prefix
    created-by = "amigo-cosmin"
  }
}

resource "aws_s3_bucket_acl" "acl_properties" {
  bucket = aws_s3_bucket.example_bucket.id
  acl = "private"
}

resource "aws_s3_bucket" "cosmin_bucket" {
  bucket = "cosmin-test-bucket-import"
  force_destroy = false
  acl = "private"
}
resource "aws_s3_bucket_acl" "acl_properties_for_import_bucket" {
  bucket = "cosmin-test-bucket-import"
  acl = "private"
}