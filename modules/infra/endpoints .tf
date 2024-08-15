# rds_endpoints_module/main.tf
resource "aws_rds_cluster_endpoint" "reader" {
  cluster_identifier          = aws_rds_cluster.cluster_web.id
  cluster_endpoint_identifier = var.reader_endpoint_identifier
  custom_endpoint_type        = "READER"

  static_members = aws_rds_cluster_instance.reader.id
}

resource "aws_rds_cluster_endpoint" "any" {
  cluster_identifier          = aws_rds_cluster.cluster_web.id
  cluster_endpoint_identifier = var.any_endpoint_identifier
  custom_endpoint_type        = "ANY"
}

