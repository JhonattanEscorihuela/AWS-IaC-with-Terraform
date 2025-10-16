# Create a IAM group
resource "aws_iam_group" "cmtr_iam_group" {
  name = var.iam_group_name
}

# data source to reference an existing bucket
data "aws_s3_bucket" "existing_bucket" {
  bucket = "cmtr-mg0vmvp0-bucket-1760653519"
}

# Create a IAM policy
resource "aws_iam_policy" "cmtr_iam_policy" {
  name        = var.iam_policy_name
  tags        = var.s3_tags
  description = "IAM policy for S3 access"
  policy = templatefile("${path.module}/policy.json", {
    bucket_name = data.aws_s3_bucket.existing_bucket.bucket
  })
}

# Create a IAM role
resource "aws_iam_role" "cmtr_iam_role" {
  name = var.iam_role_name
  tags = var.s3_tags
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the policy to the rol
resource "aws_iam_role_policy_attachment" "cmtr_iam_role_policy_attachment" {
  role       = aws_iam_role.cmtr_iam_role.name
  policy_arn = aws_iam_policy.cmtr_iam_policy.arn
}

# Create IAM instance profile
resource "aws_iam_instance_profile" "cmtr_iam_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.cmtr_iam_role.name
}
