output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.frontend.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.frontend.arn
}

output "s3_website_endpoint" {
  description = "The direct S3 website endpoint"
  value       = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

# We keep this name so the Root output doesn't break, 
# but we point it to the S3 endpoint instead of CloudFront.
output "cloudfront_domain_name" {
  description = "The endpoint for the frontend (Direct S3)"
  value       = aws_s3_bucket_website_configuration.frontend.website_endpoint
}