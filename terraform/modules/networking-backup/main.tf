provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create public subnets
resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-${each.key}"
  }
}

# Create private subnets
resource "aws_subnet" "private" {
  for_each = toset(var.private_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.key
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-${each.key}"
  }
}

# Create a security group for the load balancer
resource "aws_security_group" "lb_sg" {
  name        = "${var.project_name}-lb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
    }
  ]

  tags = {
    Name = "${var.project_name}-lb-sg"
  }
}

# Create an Application Load Balancer
resource "aws_lb" "app" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  subnets            = values(aws_subnet.public)[*].id
  security_groups    = [aws_security_group.lb_sg.id]

  enable_http2  = true
  idle_timeout  = 60
  ip_address_type = "ipv4"

  tags = {
    Name = "${var.project_name}-alb"
  }
}
