# StartTech Infrastructure - Main Configuration
# Student: Abdulsamad - 1174

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "starttech-terraform-state-1174"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "starttech-terraform-locks-1174"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "StartTech"
      Environment = var.environment
      Student     = "Abdulsamad-1174"
      ManagedBy   = "Terraform"
    }
  }
}

# Data sources
data "aws_availability_zones" "available" {
  state = "available"
}

# Networking Module
module "networking" {
  source = "./modules/networking"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# Storage Module (S3 + CloudFront)
module "storage" {
  source = "./modules/storage"

  project_name            = var.project_name
  environment             = var.environment
  enable_cloudfront_tags  = false  # Keep false until AWS account verified
}

# Compute Module (EC2)
module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  instance_type     = var.instance_type
  
  depends_on = [module.networking]
}

# Cache Module (ElastiCache Redis)
module "cache" {
  source = "./modules/cache"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  ec2_security_group_id = module.compute.ec2_security_group_id
  
  depends_on = [module.compute]
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  instance_id  = module.compute.instance_id
  
  depends_on = [module.compute]
}