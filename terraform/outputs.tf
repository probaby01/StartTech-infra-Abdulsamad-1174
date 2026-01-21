output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "s3_bucket_name" {
  description = "S3 bucket name for frontend"
  value       = module.storage.bucket_name
}

output "frontend_url" {
  description = "The URL of the website (Direct S3 Endpoint)"
  value       = module.storage.cloudfront_domain_name
}

output "backend_public_ip" {
  description = "Backend instance public IP"
  # Note: If your compute module isn't finished yet, you might need to 
  # comment this out temporarily to pass 'terraform validate'
  value       = try(module.compute.instance_public_ip, "Pending deployment")
}

output "redis_endpoint" {
  description = "Redis cluster endpoint"
  value       = try(module.cache.redis_endpoint, "Pending deployment")
}

output "redis_port" {
  description = "Redis cluster port"
  value       = try(module.cache.redis_port, "6379")
}