variable "project_name" {
  description = "Project name"
  type        = string
}

variable "asg_name" {
  description = "Auto Scaling Group name"
  type        = string
}

variable "target_group_arn" {
  description = "Target Group ARN"
  type        = string
}

variable "alb_arn" {
  description = "ALB ARN"
  type        = string
}