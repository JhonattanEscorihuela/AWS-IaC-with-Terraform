variable "launch_template_name" {
  type    = string
  default = "cmtr-mg0vmvp0-template"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID to use for instances"
  type        = string
  default     = "ami-09e6f87a47903347c"
}

variable "security_group_id_ssh" {
  type = string
}

variable "security_group_id_http_private" {
  type = string
}

variable "asg_name" {
  type    = string
  default = "cmtr-mg0vmvp0-asg"
}

variable "public_subnet_a_id" {
  type = string
}

variable "public_subnet_b_id" {
  type = string
}

variable "lb_name" {
  type    = string
  default = "cmtr-mg0vmvp0-lb"
}

variable "security_group_id_http" {
  type = string
}

variable "vpc_id" {
  type = string
}
