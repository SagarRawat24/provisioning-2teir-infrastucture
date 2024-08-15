# alb_sg_module/main.tf
resource "aws_security_group" "alb_sg" {
  name        = var.alb_scg_name
  description = var.alb_scg_description
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = var.ingress_http_description
    from_port   = var.ingress_http_from_port
    to_port     = var.ingress_http_to_port
    protocol    = var.ingress_http_protocol
    cidr_blocks = var.ingress_http_cidr_blocks
  }

  ingress {
    from_port   = var.ingress_https_from_port
    to_port     = var.ingress_https_to_port
    protocol    = var.ingress_https_protocol
    cidr_blocks = var.ingress_https_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = "applb_web"
}
