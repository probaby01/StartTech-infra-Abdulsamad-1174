terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "StartTech"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
terraform {
  required_version = ">= 1.0"
  
  backend "s3" {
    bucket = "starttech-terraform-state-1174"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}