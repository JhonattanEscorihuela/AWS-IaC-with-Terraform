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

# S3 bucket name for remote state
variable "state_bucket" {
  description = "S3 bucket name for remote state"
  type        = string
}

# S3 key path for remote state file
variable "state_key" {
  description = "S3 key path for remote state file"
  type        = string
}

# Name of VPC
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "cmtr-mg0vmvp0-01-vpc"
}
