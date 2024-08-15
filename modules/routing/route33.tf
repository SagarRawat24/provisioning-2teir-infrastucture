# route53_module/main.tf
data "aws_route53_zone" "domain_name" {
  name         = var.domain_name
  private_zone = var.private_zone
}

resource "aws_route53_record" "cloudfront_record" {
  zone_id = data.aws_route53_zone.domain_name.zone_id
  name    = "${data.aws_route53_zone.domain_name_dev.name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.my_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.my_distribution.hosted_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}






