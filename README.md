# StartTech Infrastructure - Terraform IaC

Infrastructure as Code for the StartTech CI/CD Application using Terraform.

## 📁 Project Structure
```
StartTech-infra-Abdulsamad-1174/
├── .github/workflows/          # GitHub Actions for infrastructure deployment
├── terraform/
│   ├── modules/
│   │   ├── networking/        # VPC, subnets, routing
│   │   ├── compute/          # EC2, security groups, IAM
│   │   ├── storage/          # S3, CloudFront (pending verification)
│   │   ├── monitoring/       # CloudWatch logs and alarms
│   │   └── cache/            # ElastiCache Redis
│   ├── main.tf               # Root module configuration
│   ├── variables.tf          # Input variables
│   ├── outputs.tf            # Output values
│   └── provider.tf           # Provider configuration
├── scripts/                   # Infrastructure deployment scripts
└── monitoring/               # CloudWatch dashboards and queries
```

## 🏗️ Infrastructure Components

### Networking
- **VPC:** Custom VPC (10.0.0.0/16)
- **Public Subnets:** 2 subnets across AZs
- **Private Subnets:** 2 subnets across AZs
- **Internet Gateway:** For public internet access
- **Route Tables:** Configured routing

### Compute
- **EC2 Instance:** t3.micro for backend API
- **Security Groups:** EC2 access control
- **IAM Roles:** EC2 permissions for CloudWatch and ECR
- **Launch Template:** Auto-scaling ready configuration

### Storage
- **S3 Bucket:** Static website hosting for frontend
- **Bucket Policy:** Public read access
- **Website Configuration:** SPA routing support

### Cache
- **ElastiCache Redis:** cache.t3.micro cluster
- **Subnet Group:** Private subnet deployment
- **Security Group:** Port 6379 access control

### Monitoring
- **CloudWatch Log Groups:** Application and backend logs
- **CloudWatch Alarms:** CPU utilization monitoring

## 🚀 Deployment

### Prerequisites
- AWS CLI configured
- Terraform 1.10+
- Appropriate AWS credentials

### Deploy Infrastructure
```bash
cd terraform

# Initialize Terraform
terraform init

# Review changes
terraform plan

# Apply infrastructure
terraform apply
```

### Destroy Infrastructure
```bash
cd terraform
terraform destroy
```

## 📊 Outputs

After deployment, Terraform outputs:

- `vpc_id` - VPC identifier
- `backend_public_ip` - EC2 instance public IP
- `s3_bucket_name` - Frontend S3 bucket name
- `s3_website_endpoint` - S3 website URL
- `redis_endpoint` - ElastiCache Redis endpoint
- `redis_port` - Redis port (6379)
- `backend_log_group` - CloudWatch log group name
- `application_log_group` - Application log group name

## 🔐 Security

- IAM roles with least-privilege policies
- Security groups restricting access
- Private subnets for Redis
- Public access only for S3 frontend

## 📝 Notes

- **CloudFront:** Configured but requires AWS account verification
- **ALB:** Not included due to account limitations
- **Region:** us-east-1

## 👥 Project Info

- **Student:** Abdulsamad
- **Student ID:** 1174
- **Assessment:** StartTech Month 3 - DevOps CI/CD