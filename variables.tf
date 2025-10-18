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

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "cmtr-mg0vmvp0-instance"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
