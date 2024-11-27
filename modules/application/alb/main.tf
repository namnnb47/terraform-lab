resource "aws_lb" "alb" {
  name               = "terraform-lab-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]
  subnets            = var.subnets
  tags = {
    Name = "alb-security-group"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "react-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip" 
  health_check {
    path = "/"
    interval = 30
    timeout  = 5
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}


