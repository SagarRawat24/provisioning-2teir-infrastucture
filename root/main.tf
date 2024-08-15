module "infra" {
  source = "../modules/vpc"

  cidr_block              = var.cidr_block
  tags                    = var.tags
  internet_gateway_name   = var.internet_gateway_name
  private_subnet_1_cidr   = var.private_subnet_1_cidr
  private_subnet_1_az     = var.private_subnet_1_az
  private_subnet_1_name   = var.private_subnet_1_name
  private_subnet_2_cidr   = var.private_subnet_2_cidr
  private_subnet_2_az     = var.private_subnet_2_az
  private_subnet_2_name   = var.private_subnet_2_name
  public_route_name       = var.public_route_name
  private_route_name      = var.private_route_name
  connectivity_type       = var.connectivity_type
  allocation_id           = var.allocation_id
  dependency              = var.dependency
  domain                  = var.domain
  public_subnet_1_cidr    = var.public_subnet_1_cidr
  public_subnet_1_az      = var.public_subnet_1_az
  public_subnet_2_cidr    = var.public_subnet_2_cidr
  public_subnet_2_az      = var.public_subnet_2_az
}


module "routing" {
  source = "../modules/acm"

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  key_algorithm             = var.key_algorithm
  environment               = var.environment
}



module "routing" {
  source = "../modules/alb_web"

  name = var.name
  internal = var.internal
  loadblancer_type = var.load_balancer_type


}





module "routing" {
  source = " ../modules/cloudfront"


  enabled                  = var.enabled
  aliases                  = var.aliases
  http_port                = var.http_port
  https_port               =  var.https_port
  origin_protocol_policy   = var.origin_protocol_policy
  origin_ssl_protocols     = var.origin_ssl_protocols
  allowed_methods          = var.allowed_methods
  cached_methods           = var.cached_methods
  viewer_protocol_policy   = var.viewer_protocol_policy
  forwarded_values_headers = var.forwarded_values_headers
  query_string             = var.query_string
  cookies_forward          = var.cookies
  restriction_type         = var.restriction_type
  locations                = var.locations
  tags                     = var.tags
  ssl_support_method       = var.ssl_support_method
  minimum_protocol_version = var.minimum_protocol_version

}


module "routing" {
  source = "../modules/route33"

  domain_name = var.domain_name
  private_zone = var.private_zone

  evaluate_target_health = var.evaluate_target_health

}



module "infra" {
  source = "../modules/alb_scg_web"
 
 
  alb_scg_name             = var.alb_scg_name
  alb_scg_description      = var.alb_scg_description

  ingress_http_description = var.ingress_http_description
  ingress_http_from_port   = var.ingress_http_from_port
  ingress_http_to_port     = var.ingress_http_to_port
  ingress_http_protocol    = var.ingress_http_protocol
  ingress_http_cidr_blocks = var.ingress_http_cidr_blocks

  ingress_https_description = var.ingress_https_description
  ingress_https_from_port   = var.ingress_https_from_port
  ingress_https_to_port     = var.ingress_https_to_port
  ingress_https_protocol    = var.ingress_https_protocol
  ingress_https_cidr_blocks = var.ingress_https_cidr_blocks

  egress_from_port   = var.egress_from_port
  egress_to_port     = var.egress_to_port
  egress_protocol    = var.egress_protocol
  egress_cidr_blocks = var.egress_cidr_blocks
}



module "infra"{
  source = "../modules/asg_web_scg"


 asg_sg_name             = var.asg_sg_name
 asg_scg_description     = var.asg_scg_description
 
 asg_ingress_discription      = var.asg_scg_ingress_discription
 asg_ingress_http_from_port   = var.ingress_http_from_port
 asg_ingress_http_to_port     = var.ingress_http_to_port
 asg_ingress_http_protocol    = var.ingress_http_protocol


 asg_from_port   = var.asg_scg_ingress_from_port
 asg_to_port     = var.asg_scg_ingress_to_port
 asg_protocol    = var.ingress_https_protocol
 asg_cidr_blocks = var.ingress_https_cidr_blocks


  asg_egress_from_port   = var.egress_from_port
  asg_egress_to_port     = var.egress_to_port
  asg_egress_protocol    = var.egress_protocol
  asg_egress_cidr_blocks = var.egress_cidr_blocks
 
 
}




module "infra"{
  source = "../modules/db_sg"

  rds_sg_name = var.rds_sg_name
  rds_sg_description = var.rds_scg_discription

  rds_sg_ingress_description = var.db_ingress_description
  rds_sg_ingress_from_port =  var.db_ingress_from_port
  rds_sg_ingress_to_port =   var.db_ingress_to_port

  db_egress_from_port   = var.egress_from_port
  db_egress_to_port     = var.egress_to_port
  db_egress_protocol    = var.egress_protocol
  db_egress_cidr_blocks = var.egress_cidr_blocks

  db_rds_subnet_group = var.rds_subnet_group
 
}



module "infra" {
  source = "../modules/tg_web_dev"


  tg_name             = var.tg_name
  tg_port             = var.tg_port
  tg_protocol         = var.tg_protocol
  tg_target_type      = var.tg_target_type
  tg_protocol_version = var.tg_protocol_version

  tg_path    = var.tg_health_check_path
  tg_matcher = var.tg_health_check_matcher

 tg_listener_port          = var.tg_listener_port
 tg_listener_protocol       = var.tg_listener_protocol
  
}



# launch template 


module "infra" {
  source = "../modules/launch_template_web"
  
  lt_name          = var.lt_name
  lt_image_id      = var.lt_image_id
  lt_key_name      = var.lt_key_name
  lt_instance_type = var.lt_instance_type
  associate_public_ip_address = var.associate_public_ip_address

}


#  asg

module "infra" {
  source = "../modules/asg_web"

  asd_name = var.asg_name
  asg_max_size = var.asg_max_size
  asg_min_size = var.asg_mix_size
  asg_desired_capacity = var.asg_desired_capacity

  asg_health_check_type = var.asg_health_check_type
  asg_health_check_grace_period = var.health_check_grace_period

}


module "infra" {
   source = "../modules/rds_aurora"

  rds_engine                 = var.rds_engine
  rds_engine_mode            = var.rds_engine_mode
  rds_engine_version         = var.rds_engine_version
  rds_cluster_identifier     = var.rds_cluster_identifier
  rds_master_username        = var.rds_master_username
  rds_master_password        = var.rds_master_password
  rds_backup_retention_period = var.backup_retention_period
  rds_skip_final_snapshot    = var.skip_final_snapshot   
  rds_count                   = var.rds_instance_count
  rds_instance_class         = var.rds_instance_class
  rds_publicly_accessible   = var.rds_publicly_accessible
  rds_promotion_teir         = var.rds_promotion_teir
}


module "infra" {
  source = "../modules/endpoints"
 
  cluster_endpoint_identifier = var.reader_endpoint_identifier
   cluster_any_endpoint_identifier = var.any_endpoint_identifier

}





















