# Target Group
resource "aws_lb_target_group" "store_locator_tg" {
  name        = "store-locator-tg"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Attach Rule to Existing Listener
resource "aws_lb_listener_rule" "store_locator_listener_rule" {
  listener_arn = var.existing_listener_arn # Provide the ARN of the existing listener
  priority     = 100                       # Adjust priority as per your routing logic

  condition {
    host_header {
      values = ["store-locator.example.com"] # Replace with the actual domain
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.store_locator_tg.arn
  }
}

# ECS Service
resource "aws_ecs_service" "store_locator_service" {
  name            = "store-locator-service"
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets_id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.store_locator_tg.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_target_group.store_locator_tg, aws_lb_listener_rule.store_locator_listener_rule]
}
