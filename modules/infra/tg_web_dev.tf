# Existing HTTP Target Group
# lb_target_group_module/main.tf
resource "aws_lb_target_group" "target-group-dev-web" {
  name             = var.tg_name
  port             = var.tg_port
  protocol         = var.tg_protocol
  vpc_id           = aws_vpc.main_vpc.id
  target_type      = var.tg_target_type
  protocol_version = var.tg_protocol_version

  health_check {
    path    = var.tg_health_check_path
    matcher = var.tg_health_check_matcher
  }
}

resource "aws_lb_listener" "alb_listener-web" {
  load_balancer_arn = aws_lb.alb-web.arn
  port              = var.tg_listener_port
  protocol          = var.tg_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-dev-web.arn
  }
}
