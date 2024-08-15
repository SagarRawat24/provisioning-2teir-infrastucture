terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

# Declare provider with region and credentials
provider "aws" {
  region     = var.region
  access_key = var.access_key # encrypted access key
  secret_key = var.secret_key # encrypted secret key
}