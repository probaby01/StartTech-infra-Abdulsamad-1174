# Security Group for Redis
resource "aws_security_group" "redis" {
  name        = "${var.project_name}-redis-sg"
  description = "Security group for Redis ElastiCache"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-redis-sg"
    Environment = var.environment
    Project     = "StartTech"
    ManagedBy   = "Terraform"
    Student     = "Abdulsamad-1174"
  }
}

# ElastiCache Subnet Group
resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-redis-subnet-group"
    Environment = var.environment
    Project     = "StartTech"
    ManagedBy   = "Terraform"
    Student     = "Abdulsamad-1174"
  }

  lifecycle {
    ignore_changes = [subnet_ids]
  }
}

# ElastiCache Redis Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id      = "starttech-redis"
  engine          = "redis"
  node_type       = "cache.t3.micro"  # <-- update to the current type
  num_cache_nodes = 1
  subnet_group_name = aws_elasticache_subnet_group.redis.name

  security_group_ids = ["sg-0d14efc08f3b367ad"]  # keep the SG in the same VPC

  tags = {
    Name      = "starttech-redis"
    ManagedBy = "Terraform"
    Project   = "StartTech"
    Student   = "Abdulsamad-1174"
  }
}
