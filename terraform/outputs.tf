# StartTech Infrastructure - Outputs
# Student: Abdulsamad - 1174

# Networking Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnet_ids
}

# Compute Outputs
output "instance_id" {
  description = "EC2 instance ID"
  value       = module.compute.instance_id
}

output "instance_public_ip" {
  description = "EC2 instance public IP"
  value       = module.compute.instance_public_ip
}

# Storage Outputs
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.storage.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 website endpoint"
  value       = module.storage.s3_website_endpoint
}

output "frontend_url" {
  description = "Frontend URL"
  value       = "http://${module.storage.s3_website_endpoint}"
}

# Cache Outputs
output "redis_endpoint" {
  description = "Redis endpoint"
  value       = module.cache.redis_endpoint
}

output "redis_port" {
  description = "Redis port"
  value       = module.cache.redis_port
}