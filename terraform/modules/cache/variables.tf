variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "environment" {
  description = "The environment for deployment (like dev or prod)"
  type        = string
  default     = "prod"   # this means if you don't give a value, Terraform will use "prod"
}
