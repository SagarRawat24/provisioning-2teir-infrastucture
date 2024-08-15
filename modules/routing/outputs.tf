# route53_module/outputs.tf
output "zone_id" {
  description = "The ID of the Route 53 zone."
  value       = data.aws_route53_zone.domain_name.zone_id
}

output "record_name" {
  description = "The name of the Route 53 record."
  value       = aws_route53_record.this.name
}
