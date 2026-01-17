output "backend_log_group_name" {
  description = "CloudWatch log group name for backend"
  value       = aws_cloudwatch_log_group.backend.name
}

output "application_log_group_name" {
  description = "CloudWatch log group name for application"
  value       = aws_cloudwatch_log_group.application.name
}