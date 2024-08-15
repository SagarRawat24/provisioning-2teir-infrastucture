variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  # default     = "192.168.0.0/16"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
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

# variable "nat_gateway_id" {
#   description = "The ID of the NAT Gateway."
#   type        = string
# }

# variable "public_subnet_1_id" {
#   description = "The ID of the first public subnet."
#   type        = string
# }

# variable "public_subnet_2_id" {
#   description = "The ID of the second public subnet."
#   type        = string
# }

variable "connectivity_type" {
  description = "The connectivity type of the NAT Gateway."
  type        = string
  default     = "public"
}

# variable "subnet_id" {
#   description = "The ID of the subnet to associate with the NAT Gateway."
#   type        = string
# }

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




# alb_scg

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

# variable "tags" {
#   description = "Tags for the security group."
#   type        = map(string)
#   default     = {
#     Name = "applb_web"
#   }
# }



# asg_web_scg

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





#  db scg

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


#  alb
variable "name" {
  description = "The name of the load balancer."
  type        = string
  # default     = "lb-web-dev"
}

variable "internal" {
  description = "Whether the load balancer is internal or external."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of load balancer."
   type        = string
  # default     = "application"
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


#  launch template 

variable "instance_type" {
  type = string
  default = "t2.micro"
  
}


variable "key_name" {
  type = string
  
}


variable "image_id" {
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
variable "engine" {
  description = "The database engine to use."
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_mode" {
  description = "The database engine mode."
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "The database engine version."
  type        = string
  default     = "15.4"
}

variable "cluster_identifier" {
  description = "The identifier for the RDS cluster."
  type        = string
  default     = "aurora-cluster-dev"
}

variable "master_username" {
  description = "The master username for the RDS cluster."
  type        = string
  default     = "development"
}

variable "master_password" {
  description = "The master password for the RDS cluster."
  type        = string
}


variable "backup_retention_period" {
  description = "The number of days to retain backups for."
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deleting the cluster."
  type        = bool
  default     = true
}


variable "network_type" {
  description = "The network type to use for the RDS cluster."
  type        = string
  default     = null
}

variable "instance_count" {
  description = "The number of RDS cluster instances to create."
  type        = number
  default     = 1
}

variable "instance_class" {
  description = "The instance class to use for the RDS cluster instances."
  type        = string
  default     = "db.t3.medium"
}

variable "publicly_accessible" {
  description = "Whether the RDS cluster instances should be publicly accessible."
  type        = bool
  default     = false
}

variable "promotion_tier" {
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





