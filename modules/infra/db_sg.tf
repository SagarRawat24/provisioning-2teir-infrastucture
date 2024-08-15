# rds_sg_subnet_module/main.tf
resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  description = var.rds_scg_discription
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = var.db_ingress_description
    from_port   = var.db_ingress_from_port
    to_port     = var.db_ingress_to_port
    protocol    = var.ingress_https_protocol
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags =   "rds-aurora-sg"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.rds_subnet_group
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = "RDS subnet group"
}
