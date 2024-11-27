module "ecs_service" {
  source               = "../../modules/application/ecs_service"
  service_name         = "fe-service"
  cluster_id           = module.ecs_cluster.ecs_cluster_id
  task_definition_arn  = module.ecs_task_definition.task_definition_arn
  desired_count        = 1
  subnets              = [module.subnet.private_subnet_1, module.subnet.private_subnet_2] # Replace with your subnets
  security_group_id    = module.security_group.private_sg
  container_name       = var.container_name
  container_port       = var.container_port
  target_group_arn     = module.alb.target_group_arn
}