# route53_module/variables.tf
variable "domain_name" {
  description = "The domain name to look up in Route 53."
  type        = string
}

variable "private_zone" {
  description = "Whether the zone is private."
  type        = bool
  default     = false
}



variable "evaluate_target_health" {
  description = "Whether to evaluate the health of the target."
  type        = bool
  default     = false
}




#  cloudfront 
# cf_module/variables.tf
variable "enabled" {
  description = "Whether the distribution is enabled."
  type        = bool
  default     = true
}

variable "aliases" {
  description = "A list of aliases for the distribution."
  type        = list(string)
  default     = ["showpro.cloud"]
}

# variable "origin_domain_name" {
#   description = "The domain name of the origin."
#   type        = string
# }

# variable "origin_id" {
#   description = "The ID of the origin."
#   type        = string
# }

variable "http_port" {
  description = "The HTTP port the custom origin listens on."
  type        = number
  default     = 80
}

variable "https_port" {
  description = "The HTTPS port the custom origin listens on."
  type        = number
  default     = 443
}

variable "origin_protocol_policy" {
  description = "The protocol policy to use for this origin."
  type        = string
  default     = "http-only"
}

variable "origin_ssl_protocols" {
  description = "The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS."
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "allowed_methods" {
  description = "A list of the allowed HTTP methods."
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
}

variable "cached_methods" {
  description = "A list of the HTTP methods that CloudFront caches."
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

# variable "target_origin_id" {
#   description = "The ID of the target origin."
#   type        = string
# }

variable "viewer_protocol_policy" {
  description = "The protocol viewers can use to access your content."
  type        = string
  default     = "redirect-to-https"
}

variable "forwarded_values_headers" {
  description = "A list of headers to forward."
  type        = list(string)
  default     = []
}

variable "query_string" {
  description = "Indicates whether you want CloudFront to forward query strings to the origin."
  type        = bool
  default     = true
}

variable "cookies_forward" {
  description = "Specifies how CloudFront handles cookies."
  type        = string
  default     = "all"
}

variable "restriction_type" {
  description = "The restriction type for the geo restriction."
  type        = string
  default     = "whitelist"
}

variable "locations" {
  description = "A list of country codes for the geo restriction."
  type        = list(string)
  default     = ["IN", "US"]
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {
    Name = "sagar_project_dev"
  }
}

# variable "acm_certificate_arn" {
#   description = "The ARN of the ACM certificate."
#   type        = string
# }

variable "ssl_support_method" {
  description = "The SSL support method."
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
  type        = string
  default     = "TLSv1.2_2021"
}

# variable "depends_on" {
#   description = "A list of resources that this resource depends on."
#   type        = list(any)
# }





# alb 
# lb_module/variables.tf
# variable "name" {
#   description = "The name of the load balancer."
#   type        = string
#   # default     = "lb-web-dev"
# }

# variable "internal" {
#   description = "Whether the load balancer is internal or external."
#   type        = bool
#   default     = false
# }

# variable "load_balancer_type" {
#   description = "The type of load balancer."
#    type        = string
#   # default     = "application"
# }

# variable "security_groups" {
#   description = "The security groups associated with the load balancer."
#   type        = list(string)
# }

# variable "subnets" {
#   description = "The subnets associated with the load balancer."
#   type        = list(string)
# }

# Optional variable for vpc_id
# variable "vpc_id" {
#   description = "The VPC ID where the load balancer will be created."
#   type        = string
# }



# acm
# acm_module/variables.tf
variable "domain_name" {
  description = "The primary domain name for the ACM certificate."
  type        = string
}

variable "subject_alternative_names" {
  description = "A list of alternative domain names for the ACM certificate."
  type        = list(string)
  default     = ["*.showpro.cloud" ]
}

variable "validation_method" {
  description = "The method to use for domain validation."
  type        = string
  default     = "DNS"
}

variable "key_algorithm" {
  description = "The algorithm to use for the key."
  type        = string
  default     = "RSA_2048"
}

variable "environment" {
  description = "The environment tag for the ACM certificate."
  type        = string
  default     = "sagar_domain"
}
