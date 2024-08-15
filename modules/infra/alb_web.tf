# lb_module/main.tf
resource "aws_lb" "alb-web" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.alb-scg_dev.id]
  subnets            = [aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id]
  # vpc_id             = aws_vpc.main_vpc.id
}
