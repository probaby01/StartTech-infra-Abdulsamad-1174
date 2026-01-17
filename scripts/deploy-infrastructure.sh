#!/bin/bash
set -e

echo "=== StartTech Infrastructure Deployment ==="

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "Error: Terraform is not installed"
    exit 1
fi

# Navigate to terraform directory
cd ../terraform

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate configuration
echo "Validating Terraform configuration..."
terraform validate

# Format Terraform files
echo "Formatting Terraform files..."
terraform fmt -recursive

# Plan infrastructure changes
echo "Planning infrastructure changes..."
terraform plan -out=tfplan

# Ask for confirmation
read -p "Do you want to apply these changes? (yes/no): " confirm

if [ "$confirm" == "yes" ]; then
    echo "Applying infrastructure changes..."
    terraform apply tfplan
    
    
    echo "Infrastructure deployment complete!"
    echo "Getting outputs..."
    terraform output
else
    echo "Deployment cancelled"
    rm tfplan
    exit 0
fi