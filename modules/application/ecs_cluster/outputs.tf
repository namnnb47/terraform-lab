output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.ecs_cluster.id
}
output "ecs_cluster_name" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.ecs_cluster.name
}
