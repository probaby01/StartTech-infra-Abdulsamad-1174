variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
variable "enable_cloudfront_tags" {
  description = "Flag to enable/disable CloudFront tags to bypass account verification restrictions"
  type        = bool
  default     = false # Keep this false until your AWS account is fully verified
}

