output "repository_clone_url_http" {
  description = "HTTP URL to clone the repository"
  value = aws_codecommit_repository.this.clone_url_http
}

output "repository_arn" {
  description = "ARN of the repository"
  value = aws_codecommit_repository.this.arn
}

output "repository_name" {
  description = "ARN of the repository"
  value = aws_codecommit_repository.this.repository_name
}

