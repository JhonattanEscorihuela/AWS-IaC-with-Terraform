# Create a S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  tags   = var.s3_tags
}
