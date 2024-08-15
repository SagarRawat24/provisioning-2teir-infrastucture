

resource "aws_acm_certificate" "cert_validation" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  key_algorithm             = var.key_algorithm

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}


