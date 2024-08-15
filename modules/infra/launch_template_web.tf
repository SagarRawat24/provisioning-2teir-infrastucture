# launch_template_module/main.tf
resource "aws_launch_template" "template-web" {
  name          = var.lt_name
  image_id      = var.image_id
  key_name      = var.key_name
  instance_type = var.instance_type

  network_interfaces {
    device_index                =  0
    security_groups             = [aws_security_group.asg_scg_dev_web.id]
    subnet_id                   =  aws_subnet.public_subnet_1.id   
    associate_public_ip_address =  var.associate_public_ip_address
  }

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = "ltemp-web"
  }
}
