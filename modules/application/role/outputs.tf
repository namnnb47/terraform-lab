output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS Task Execution IAM Role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

