# Terraform EC2 Secure Instance

This Terraform module deploys a secure EC2 instance with an IAM instance profile attached, following AWS security best practices.

The instance can securely access AWS services using temporary credentials via STS instead of hardcoded access keys.

---

## Architecture

EC2 Instance  
→ Security Group  
→ IAM Instance Profile  
→ IAM Role  
→ STS Temporary Credentials  
→ AWS Services (S3, etc)

---

## What this module creates

- EC2 instance
- Security group with restricted SSH access
- IAM instance profile attachment
- Public IP for SSH access
- Terraform outputs for connection details

---

## Security Features

- No hardcoded AWS credentials
- Least privilege IAM access
- Restricted SSH CIDR
- Instance profile based authentication
- Temporary STS credentials

---

## Variables

| Name | Description |
|------|-------------|
| instance_name | EC2 instance name |
| instance_type | EC2 instance type |
| key_name | SSH key pair |
| iam_instance_profile | IAM instance profile |
| allowed_ssh_cidr | Allowed SSH IP |
| vpc_id | VPC ID |
| subnet_id | Subnet ID |
| ami_id | AMI ID |

---

## Example

examples/example.tfvars

instance_name        = "muiz-secure-ec2"  
instance_type        = "t2.micro"  
key_name             = "muiz-bastion-1"  
iam_instance_profile = "muiz-iam-lab-ec2-profile"  
allowed_ssh_cidr     = "YOUR_IP/32"  
vpc_id               = "vpc-xxxx"  
subnet_id            = "subnet-xxxx"  
ami_id               = "ami-xxxx"  

---

## Deploy

terraform -chdir=terraform init  
terraform -chdir=terraform plan -var-file=../examples/example.tfvars  
terraform -chdir=terraform apply -var-file=../examples/example.tfvars  

---

## Validate IAM Role

SSH into the instance:

ssh -i key.pem ec2-user@PUBLIC_IP

Verify role:

aws sts get-caller-identity

You should see an assumed-role ARN.

---

## Destroy

terraform -chdir=terraform destroy -var-file=../examples/example.tfvars

---

## Use Case

This module demonstrates secure EC2 access to AWS services using IAM roles and Terraform infrastructure as code.
