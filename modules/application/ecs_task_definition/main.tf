resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/react-app-service"
  retention_in_days = 7  # Adjust the retention period as needed
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  container_definitions    = jsonencode([
    {
      name  = var.container_name
      image = var.container_image
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_log_group.name  #aws_cloudwatch_log_group.ecs_log_group.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
