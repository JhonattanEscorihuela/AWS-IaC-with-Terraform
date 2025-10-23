variable "aws_region" {
  description = "Región de AWS para desplegar la infraestructura."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["a", "b", "c"]
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "cmtr-mg0vmvp0-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block of vpc main"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnets cidrs"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24", "10.10.5.0/24"]
}

variable "igw_name" {
  description = "Name of internet gateway"
  type        = string
  default     = "cmtr-mg0vmvp0-igw"
}

variable "rt_name" {
  description = "Name of routing table"
  type        = string
  default     = "cmtr-mg0vmvp0-rt"
}

variable "allowed_ip_range" {
  description = "List of IP address ranges for secure access"
  type        = list(string)
}
