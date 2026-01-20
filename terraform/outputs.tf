output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "backend_public_ip" {
  description = "Backend instance public IP"
  value       = module.compute.instance_public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name for frontend"
  value       = module.storage.bucket_name
}

# FIXED: Changed from website_endpoint to cloudfront_domain_name
output "frontend_url" {
  description = "The URL of the website via CloudFront"
  value       = module.storage.cloudfront_domain_name
}

output "backend_log_group" {
  description = "Backend CloudWatch log group"
  value       = module.monitoring.backend_log_group_name
}

output "application_log_group" {
  description = "Application CloudWatch log group"
  value       = module.monitoring.application_log_group_name
}

output "redis_endpoint" {
  description = "Redis cluster endpoint"
  value       = module.cache.redis_endpoint
}

output "redis_port" {
  description = "Redis cluster port"
  value       = module.cache.redis_port
}