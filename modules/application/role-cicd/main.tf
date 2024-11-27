
resource "aws_iam_role" "codepipeline_role" {
  name = "CodePipelineRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}

resource "aws_iam_policy" "custom_codepipeline_policy" {
  name        = "CustomCodePipelinePolicy"
  description = "Custom policy for CodePipeline"
  policy      = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "codepipeline:*",
          "s3:*",
          "codebuild:*",
          "iam:PassRole",
          "cloudwatch:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_custom_policy" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.custom_codepipeline_policy.arn
}



resource "aws_iam_policy" "codecommit_access_policy" {
  name        = "CodeCommitAccessPolicy"
  description = "Grants CodePipeline access to CodeCommit repository"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "codecommit:GitPull",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:UploadArchive",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:CancelUploadArchive"
        ],
        Resource = "arn:aws:codecommit:*:*:terraform-repo"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_codecommit_access" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codecommit_access_policy.arn
}

resource "aws_iam_role" "codebuild_role" {
  name               = "CodeBuildRole"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role_policy.json
}

data "aws_iam_policy_document" "codebuild_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "CodeBuildPolicy"
  description = "Policy for CodeBuild to access necessary AWS services."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cognito-idp:*",
          "ecr:*",
          "ecs:*",
          "iam:*",
          "iam:*",
          "ec2:*",
          "cloudfront:*",
          "logs:*",
          "s3:*",
          "elasticloadbalancing:*",
          "rds:*",
          "dynamo:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::terraform-lab-codepipeline-bucket",
          "arn:aws:s3:::terraform-lab-codepipeline-bucket/*"
        ]
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_codebuild_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}


resource "aws_iam_policy" "dynamodb_lock_table_policy" {
  name        = "DynamoDBLockTablePolicy"
  description = "Policy cho phép quyền truy cập DynamoDB cho bảng terraform-lock-table"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:DeleteItem",
          "dynamodb:UpdateItem"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:333516754419:table/terraform-lock-table"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "attach_dynamodb_policy" {
  role       = aws_iam_role.codebuild_role.name  # Thay thế bằng tên vai trò thực tế của bạn
  policy_arn = aws_iam_policy.dynamodb_lock_table_policy.arn
}

