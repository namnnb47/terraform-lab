resource "aws_ecr_repository" "ecr_repository" {
  name = var.repository_name

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = var.tags
}
