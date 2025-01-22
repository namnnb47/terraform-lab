module "ecs_task_definition" {
  source             = "./modules/application/ecs_task_definition"
  region             = var.region
  family             = var.family
  cpu                = var.cpu
  memory             = var.memory
  execution_role_arn = module.role.ecs_task_execution_role_arn # Replace with your IAM role ARN
  container_name     = var.container_name
  container_image    = var.container_image # Replace with your Docker image
  container_port     = 80
}