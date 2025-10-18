# Region for AWS resources
variable "aws_region" {
  description = "Región de AWS para desplegar la infraestructura."
  type        = string
}

# Required version
variable "required_version" {
  description = "Required version to deploy resources"
  type        = string
  default     = ">=1.5.7"
}

# Project identifier for tagging
variable "project_id" {
  description = "Project identifier for tagging"
  type        = string
}

# Tags for EC2 instances
variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Terraform = true
    Project   = "cmtr-mg0vmvp0"
  }
}

# Name of AWS launch template
variable "launch_template_name" {
  description = "Name of the AWS launch template"
  type        = string
  default     = "cmtr-mg0vmvp0-template"
}

# Type of EC2 instance
variable "instance_type" {
  description = "Type of EC2 instance to deploy"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "Existing SSH key pair name"
  type        = string
  default     = "cmtr-mg0vmvp0-keypair"
}

variable "instance_profile_name" {
  description = "Name of the IAM Instance Profile"
  type        = string
  default     = "cmtr-mg0vmvp0-instance_profile"
}

variable "ec2_sg_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "http_sg_id" {
  description = "HTTP security group ID"
  type        = string
}

# Name Auto Scaling Group
variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
  default     = "cmtr-mg0vmvp0-asg"
}

variable "public_subnet_a_id" {
  description = "ID of public subnet A"
  type        = string
}

variable "public_subnet_b_id" {
  description = "ID of public subnet B"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for instances"
  type        = string
  default     = "ami-09e6f87a47903347c"
}

# Name of Application Load Balancer
variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
  default     = "cmtr-mg0vmvp0-loadbalancer"
}

variable "cmtr-mg0vmvp0-sglb" {
  description = "Security group for Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}
