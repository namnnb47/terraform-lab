output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ecr_repository.repository_url
}
