# sg_module/main.tf
resource "aws_security_group" "asg_sg" {
  name        = var.asg_sg_name
  description = var.asg_scg_discription
  vpc_id      = var.vpc_id

  ingress {
    description     = var.asg_scg_ingress_discription
    from_port       = var.ingress_http_from_port
    to_port         = var.ingress_http_to_port
    protocol        = var.ingress_http_protocol
    security_groups = [aws_security_group.alb-scg_dev.id]
  }

  ingress {  // ssh
    from_port   = var.asg_scg_ingress_from_port
    to_port     = var.asg_scg_ingress_to_port
    protocol    = var.ingress_https_protocol
    cidr_blocks = var.ingress_https_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags =  "asg_sg"
}
