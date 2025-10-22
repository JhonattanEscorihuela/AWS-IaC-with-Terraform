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
  description = "ID of the VPC"
  type        = string
  default     = "cmtr-mg0vmvp0-vpc"
}

variable "public_subnet_1" {
  description = "Name of the first public subnet"
  type        = string
  default     = "cmtr-mg0vmvp0-public-subnet1"
}

variable "public_subnet_2" {
  description = "ID of the second public subnet"
  type        = string
  default     = "cmtr-mg0vmvp0-public-subnet2"
}

variable "security_group_ssh_name" {
  description = "Name of the SSH security group"
  type        = string
  default     = "cmtr-mg0vmvp0-sg-ssh"
}

variable "security_group_http_name" {
  description = "Name of the HTTP security group"
  type        = string
  default     = "cmtr-mg0vmvp0-sg-http"
}

variable "security_group_lb_name" {
  description = "Name of the Load Balancer security group"
  type        = string
  default     = "cmtr-mg0vmvp0-sg-lb"
}

variable "blue_weight" {
  description = "The traffic weight for the Blue Target Group. Specifies the percentage of traffic routed to the Blue environment."
  type        = number
  default     = 100
}

variable "green_weight" {
  description = "The traffic weight for the Green Target Group. Specifies the percentage of traffic routed to the Green environment."
  type        = number
  default     = 0
}

variable "ami_id" {
  description = "AMI ID to use for instances"
  type        = string
  default     = "ami-09e6f87a47903347c"
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

variable "name_launch_template_blue" {
  description = "Name of the Blue Launch Template"
  type        = string
  default     = "cmtr-mg0vmvp0-blue-template"
}

variable "name_launch_template_green" {
  description = "Name of the Green Launch Template"
  type        = string
  default     = "cmtr-mg0vmvp0-green-template"
}

variable "name_load_balancer" {
  description = "Name of the Load Balancer"
  type        = string
  default     = "cmtr-mg0vmvp0-lb"
}

variable "name_target_group_blue" {
  description = "Name of the Blue Target Group"
  type        = string
  default     = "cmtr-mg0vmvp0-blue-tg"
}

variable "name_target_group_green" {
  description = "Name of the Green Target Group"
  type        = string
  default     = "cmtr-mg0vmvp0-green-tg"
}

variable "name_asg_blue" {
  description = "Name of the Blue Auto Scaling Group"
  type        = string
  default     = "cmtr-mg0vmvp0-blue-asg"
}

variable "name_asg_green" {
  description = "Name of the Green Auto Scaling Group"
  type        = string
  default     = "cmtr-mg0vmvp0-green-asg"
}
