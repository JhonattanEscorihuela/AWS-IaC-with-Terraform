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

# Name of VPC
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "cmtr-mg0vmvp0-01-vpc"
}

# CIDR block for the VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

# List of availability zones
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["a", "b", "c"]
}


# CIDRs for public subnets
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24", "10.10.5.0/24"]
}

# Name of internet gateway
variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "cmtr-mg0vmvp0-01-igw"
}

# Name of route table
variable "route_table_name" {
  description = "Name of the Route Table"
  type        = string
  default     = "cmtr-mg0vmvp0-01-rt"
}

# Name of SSH key pair
variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}

# Name of SSH key pair
variable "ssh_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "cmtr-mg0vmvp0-keypair"
}

# Name of EC2 instance
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "cmtr-mg0vmvp0-ec2"
}

# Tags for EC2 instance
variable "instance_tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default = {
    Project = "epam-tf-lab"
    ID      = "mg0vmvp0"
  }
}

# Name of SG
variable "sg_name" {
  description = "Name of the Security Group"
  type        = string
  default     = "cmtr-mg0vmvp0-sg"
}

# AMI ID for the EC2 instance
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0023921b4fcd5382b"
}

# Instance type for the EC2 instance
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
