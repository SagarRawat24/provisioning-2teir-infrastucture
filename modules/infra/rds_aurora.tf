# rds_module/main.tf
resource "aws_rds_cluster" "cluster_web" {
  engine                 = var.engine
  engine_mode            = var.engine_mode
  engine_version         = var.engine_version
  cluster_identifier     = var.cluster_identifier
  master_username        = var.master_username
  master_password        = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot    = var.skip_final_snapshot

  # Uncomment if needed
  # network_type           = var.network_type
}

resource "aws_rds_cluster_instance" "primary" {
  count               = var.instance_count
  identifier          = "${var.cluster_identifier}-${count.index}"
  cluster_identifier  = aws_rds_cluster.cluster_web.id
  instance_class      = var.instance_class
  engine              = aws_rds_cluster.cluster_web.engine
  engine_version      =  aws_rds_cluster.cluster_web.engine_version
  publicly_accessible = var.publicly_accessible
}

resource "aws_rds_cluster_instance" "reader" {
  identifier          = "${var.cluster_identifier}-reader"
  cluster_identifier  = aws_rds_cluster.cluster_web.id
  instance_class      = var.instance_class
  engine              = aws_rds_cluster.cluster_web.engine
  engine_version      = var.engine_version
  publicly_accessible = aws_rds_cluster.cluster_web.engine_version
  promotion_tier      = var.promotion_tier
}
