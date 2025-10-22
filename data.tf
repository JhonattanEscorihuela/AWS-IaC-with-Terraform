data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_1]
  }
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_2]
  }
}


data "aws_security_group" "ssh" {
  filter {
    name   = "group-name"
    values = [var.security_group_ssh_name]
  }
}

data "aws_security_group" "http" {
  filter {
    name   = "group-name"
    values = [var.security_group_http_name]
  }
}

data "aws_security_group" "lb" {
  filter {
    name   = "group-name"
    values = [var.security_group_lb_name]
  }
}
