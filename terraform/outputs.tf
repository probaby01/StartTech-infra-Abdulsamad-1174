output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.compute.alb_dns_name
}

output "s3_bucket_name" {
  description = "S3 bucket name for frontend"
  value       = module.storage.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 website endpoint"
  value       = module.storage.website_endpoint
}

output "backend_log_group" {
  description = "Backend CloudWatch log group"
  value       = module.monitoring.backend_log_group_name
}

output "application_log_group" {
  description = "Application CloudWatch log group"
  value       = module.monitoring.application_log_group_name
}