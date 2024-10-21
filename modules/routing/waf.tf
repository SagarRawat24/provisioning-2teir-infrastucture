resource "aws_wafv2_web_acl" "cloudfront_waf" {
  name        = var.waf_name
  description = var.waf_description
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  # Rule 1: SQL Injection prevention
  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = var.waf_sql_injection_metric_name
      sampled_requests_enabled   = true
    }
  }

  # Rule 2: Cross-site scripting (XSS) prevention
  rule {
    name     = "rule-2"
    priority = 2

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          action_to_use {
            count {}
          }
          name = "SizeRestrictions_BODY"
        }

        rule_action_override {
          action_to_use {
            count {}
          }
          name = "NoUserAgent_HEADER"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = var.waf_xss_prevention_metric_name
      sampled_requests_enabled   = true
    }
  }

  # Rule 3: Rate-based rule to prevent DDoS attacks
  rule {
    name     = "rule-3"
    priority = 3

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = var.waf_rate_limit_threshold
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = var.waf_rate_limit_metric_name
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.waf_cloudfront_metric_name
    sampled_requests_enabled   = true
  }
}