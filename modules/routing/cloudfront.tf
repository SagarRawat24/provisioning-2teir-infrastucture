# cf_module/main.tf
resource "aws_cloudfront_distribution" "my_distribution" {
  enabled = var.enabled
  aliases = var.aliases

  origin {
    domain_name = aws_lb.alb-web.dns_name
    origin_id   = "ELB-${aws_lb.alb-web.name}"

    custom_origin_config {
      http_port              = var.http_port
      https_port             = var.https_port
      origin_protocol_policy = var.origin_protocol_policy
      origin_ssl_protocols   = var.origin_ssl_protocols
    }
  }

  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    target_origin_id       = "ELB-${aws_lb.alb-web.name}"
    viewer_protocol_policy = var.viewer_protocol_policy

    forwarded_values {
      headers      = var.forwarded_values_headers
      query_string = var.query_string
      cookies {
        forward = var.cookies_forward
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.locations
    }
  }

  tags = var.tags

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert_validation.arn
    ssl_support_method       = var.ssl_support_method
    minimum_protocol_version = var.minimum_protocol_version
  }

  depends_on = [aws_lb.alb-web]
}
