# Terraform Infrastructure for Axionvera Dashboard

This directory contains Terraform configuration files to provision AWS infrastructure for hosting the Axionvera Dashboard.

## Architecture

The Terraform configuration provisions:

- **VPC**: A virtual private cloud with public subnets
- **EC2 Instance**: Ubuntu 22.04 server with Docker and Docker Compose
- **Security Group**: Allows HTTP (80), HTTPS (443), and SSH (22) access
- **Internet Gateway**: For public internet access
- **Route Tables**: For proper network routing

## Files

- `main.tf`: Main infrastructure configuration
- `variables.tf`: Input variables for customization
- `outputs.tf`: Output values after deployment
- `user_data.sh`: Bootstrap script for EC2 instance
- `README.md`: This documentation file

## Usage

### Prerequisites

1. Install Terraform (version 1.0+)
2. Configure AWS credentials
3. Generate an SSH key pair in AWS EC2 console

### Deployment Commands

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

### Customization

You can customize the deployment by creating a `terraform.tfvars` file:

```hcl
aws_region = "us-west-2"
environment = "production"
instance_type = "t3.small"
key_name = "your-ssh-key-name"
allowed_ssh_ips = ["YOUR_IP/32"]
```

### Security

- SSH access is restricted to IPs specified in `allowed_ssh_ips`
- For production, consider:
  - Using a bastion host
  - Implementing AWS Systems Manager Session Manager
  - Adding application load balancer
  - Setting up SSL certificates

### Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Outputs

After deployment, you'll get:

- VPC ID
- Subnet IDs
- Security Group ID
- EC2 Instance ID
- Public IP address
- Public DNS name

Use the public IP or DNS to access your deployed application.
