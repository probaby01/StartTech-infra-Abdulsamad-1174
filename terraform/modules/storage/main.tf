# Generate a random suffix to ensure global uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# 1. S3 Bucket for Frontend
resource "aws_s3_bucket" "frontend" {
  # Added random hex to the name to avoid "BucketAlreadyExists" errors
  bucket = "${var.project_name}-frontend-${var.environment}-${random_id.bucket_suffix.hex}"
}

# 2. S3 Bucket Public Access Block
resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 3. S3 Bucket Website Configuration
resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# 4. S3 Bucket Policy for Public Read
resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.frontend.arn}/*"
      }
    ]
  })

  # Ensures public access settings are applied before the policy
  depends_on = [aws_s3_bucket_public_access_block.frontend]
}