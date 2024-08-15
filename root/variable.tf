



variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}


variable "region" {
  type = string
}






# alb
variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal or external"
  type        = bool
}

variable "load_balancer_type" {
  description = "The type of load balancer"
  type        = string
}


# vpc
variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "Multiteir_vpc"
  }
}


variable "internet_gateway_name" {
  description = "The name of the Internet Gateway."
  type        = string
  # default     = "internet_gtw"
}


variable "private_subnet_1_cidr" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "192.168.12.0/24"
}

variable "private_subnet_1_az" {
  description = "The availability zone for the first private subnet."
  type        = string
  default     = "us-east-1d"
}

variable "private_subnet_1_name" {
  description = "The name of the first private subnet."
  type        = string
  default     = "sagar_private_subnet_1"
}

variable "private_subnet_2_cidr" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "192.168.9.0/24"
}

variable "private_subnet_2_az" {
  description = "The availability zone for the second private subnet."
  type        = string
  default     = "us-east-1e"
}

variable "private_subnet_2_name" {
  description = "The name of the second private subnet."
  type        = string
  default     = "sagar_private_subnet_2"
}


variable "public_subnet_1_cidr" {
  type = string
  
}

variable "public_subnet_2_cidr" {
  type = string
  
}

variable "public_subnet_1_az" {
  type = string
  
}

variable "public_subnet_2_az" {
  type = string
  
}



variable "public_route_name" {
  description = "The name of the public route."
  type        = string
  default     = "public_route_dev"
}

variable "private_route_name" {
  description = "The name of the private route."
  type        = string
  default     = "private_route_dev"
}


variable "connectivity_type" {
  description = "The connectivity type of the NAT Gateway."
  type        = string
  default     = "public"
}


variable "allocation_id" {
  description = "The allocation ID of the Elastic IP for the NAT Gateway."
  type        = string
}

variable "dependency" {
  description = "List of resources that the NAT Gateway depends on."
  type        = list(string)
  default     = []
}

variable "domain" {
  description = "The domain for the Elastic IP."
  type        = string
}



# acm
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




#  cloudfront 

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



# route53

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



#  alb_scg

variable "alb_scg_name" {
  description = "The name of the security group."
  type        = string
  default     = "alb-web-dev"
}

variable "alb_scg_description" {
  description = "The description of the security group."
  type        = string
  default     = "ALB Security Group"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "ingress_http_description" {
  description = "Description for the HTTP ingress rule."
  type        = string
  default     = "HTTP from Internet"
}

variable "ingress_http_from_port" {
  description = "The starting port for the HTTP ingress rule."
  type        = number
  default     = 80
}

variable "ingress_http_to_port" {
  description = "The ending port for the HTTP ingress rule."
  type        = number
  default     = 80
}

variable "ingress_http_protocol" {
  description = "The protocol for the HTTP ingress rule."
  type        = string
  default     = "tcp"
}

variable "ingress_http_cidr_blocks" {
  description = "The CIDR blocks for the HTTP ingress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_https_description" {
  description = "Description for the HTTPS ingress rule."
  type        = string
  default     = "HTTPS from Internet"
}

variable "ingress_https_from_port" {
  description = "The starting port for the HTTPS ingress rule."
  type        = number
  default     = 443
}

variable "ingress_https_to_port" {
  description = "The ending port for the HTTPS ingress rule."
  type        = number
  default     = 443
}

variable "ingress_https_protocol" {
  description = "The protocol for the HTTPS ingress rule."
  type        = string
  default     = "tcp"
}

variable "ingress_https_cidr_blocks" {
  description = "The CIDR blocks for the HTTPS ingress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "The starting port for the egress rule."
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "The ending port for the egress rule."
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "The protocol for the egress rule."
  type        = string
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "The CIDR blocks for the egress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}




#  asg_scg
variable "asg_sg_name" {
  type = string
}

variable "asg_scg_ingress_from_port" {
  type = number
  default = 22
  
}
variable "asg_scg_ingress_to_port" {
  type = number
  default = 22
  
}


variable "asg_scg_ingress_discription" {
  type = string
  default = "HTTP from ALB"
  
}


variable "asg_scg_discription" {
  type = string
  default = "auto scaling group asg"
  
}



# db scg

variable "rds_subnet_group" {
  type = string
  default = "rds-subnet-group"  
}

variable "rds_sg_name" {
  type = string
  default = "rds-aurora-sg"

}

variable "rds_scg_discription" {
  type = string
  default = "Security group for RDS Aurora PostgreSQL"
}




variable   "db_ingress_description" {
    type = string
  }



variable  "db_ingress_from_port" {
   type = number
   default = 5432
}

variable   "db_ingress_to_port" {
  type = number
  default = 5432
}


#  target group

variable "tg_name" {
  description = "The name of the target group."
  type        = string
  default     = "target-group1-dev"
}

variable "tg_port" {
  description = "The port to use for the target group."
  type        = number
  default     = 80
}

variable "tg_protocol" {
  description = "The protocol to use for the target group."
  type        = string
  default     = "HTTP"
}



variable "tg_target_type" {
  description = "The type of target."
  type        = string
  default     = "instance"
}

variable "tg_protocol_version" {
  description = "The protocol version to use."
  type        = string
  default     = "HTTP1"
}

variable "tg_health_check_path" {
  description = "The path for the health check."
  type        = string
  default     = "/"
}

variable "tg_health_check_matcher" {
  description = "The matcher for the health check."
  type        = number
  default     = 200
}



variable "tg_listener_port" {
  description = "The port for the listener."
  type        = number
  default     = 80
}

variable "tg_listener_protocol" {
  description = "The protocol for the listener."
  type        = string
  default     = "HTTP"
}



# launch template 

variable "lt_instance_type" {
  type = string
  default = "t2.micro"
  
}


variable "lt_key_name" {
  type = string
  
}


variable "lt_image_id" {
  type = string
  
}


variable "lt_name" {
  type = string
  default = "lp-web-dev"
  
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}



#  asg 

variable "asg_name" {
  type = string
  default = "asg-web-dev"
}

variable "asg_health_check_type" {
  type = string
  default = "EC2"
}

variable "asg_max_size" {
  type = number
  
}


variable "asg_min_size" {
  type = number
  
}

variable "asg_desired_capacity" {
  type = number
  
}

variable "asg_health_check_grace_period" {
  type = number
  
}


# rds

variable "rds_engine" {
  description = "The database engine to use."
  type        = string
  default     = "aurora-postgresql"
}

variable "rds_engine_mode" {
  description = "The database engine mode."
  type        = string
  default     = "provisioned"
}

variable "rds_engine_version" {
  description = "The database engine version."
  type        = string
  default     = "15.4"
}

variable "rds_cluster_identifier" {
  description = "The identifier for the RDS cluster."
  type        = string
  default     = "aurora-cluster-dev"
}

variable "rds_master_username" {
  description = "The master username for the RDS cluster."
  type        = string
  default     = "development"
}

variable "rds_master_password" {
  description = "The master password for the RDS cluster."
  type        = string
}


variable "rds_backup_retention_period" {
  description = "The number of days to retain backups for."
  type        = number
  default     = 7
}

variable "rds_skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deleting the cluster."
  type        = bool
  default     = true
}


variable "rds_network_type" {
  description = "The network type to use for the RDS cluster."
  type        = string
  default     = null
}

variable "rds_instance_count" {
  description = "The number of RDS cluster instances to create."
  type        = number
  default     = 1
}

variable "rds_instance_class" {
  description = "The instance class to use for the RDS cluster instances."
  type        = string
  default     = "db.t3.medium"
}

variable "rds_publicly_accessible" {
  description = "Whether the RDS cluster instances should be publicly accessible."
  type        = bool
  default     = false
}

variable "rds_promotion_tier" {
  description = "The promotion tier for the reader instance."
  type        = number
  default     = 1
}


# endpoints

variable "reader_endpoint_identifier" {
  description = "The identifier for the reader endpoint."
  type        = string
  default     = "reader"
}

variable "any_endpoint_identifier" {
  description = "The identifier for the any endpoint."
  type        = string
  default     = "any"
}






















































# variable "ownerss" {
#   type = string
# }


# variable "image_name" {
#   type = string
# }


# variable "instance_type" {
#   type = string
# }

# variable "key_name" {
#   type = string
# }