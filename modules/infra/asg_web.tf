# asg_module/main.tf
resource "aws_autoscaling_group" "asg" {
  name                      = var.asg_name
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_desired_capacity
  target_group_arns         = [aws_lb_target_group.target-group-dev-web.arn]
  health_check_type         = var.asg_health_check_type
  vpc_zone_identifier       = [aws_subnet.public_subnet_1.id , aws_subnet.public_subnet_2.id]
  health_check_grace_period = var.asg_health_check_grace_period

   launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }
}

  # Optionally include availability_zones if needed
  # availability_zones = var.availability_zones

