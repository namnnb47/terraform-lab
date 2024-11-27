# S3 Bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_state_bucket
  acl    = "private"

  tags = {
    Name = "Terraform State Storage"
  }
}

# Separate resource for enabling S3 bucket versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}

resource "aws_iam_role" "dynamodb_role" {
  name = "DynamoDBTerraformRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"  # Or whatever service you're using
        }
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_policy" {
  name        = "DynamoDBTerraformPolicy"
  description = "Policy to allow access to DynamoDB for Terraform state locking"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:DeleteItem",
          "dynamodb:DescribeTable"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:us-west-2:333516754419:table/terraform-lock-table"  # Replace with your region and table ARN
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attach" {
  role       = aws_iam_role.dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}
