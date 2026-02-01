output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = values(aws_subnet.private)[*].id
}

output "lb_sg_id" {
  description = "Load Balancer Security Group ID"
  value       = aws_security_group.lb_sg.id
}

output "lb_sg_name" {
  description = "Load Balancer Security Group Name"
  value       = aws_security_group.lb_sg.name
}

output "lb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.app.arn
}

output "lb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.app.dns_name
}
