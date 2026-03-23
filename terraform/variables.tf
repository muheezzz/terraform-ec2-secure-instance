variable "project_name" {
  description = "Project name used for tagging resources."
  type        = string
  default     = "ec2-secure-instance"
}

variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "Name of the EC2 instance."
  type        = string
  default     = "secure-ec2"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name."
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name to attach to EC2."
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2."
  type        = string
}
variable "vpc_id" {
  description = "VPC ID where the EC2 instance and security group will be created."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}
