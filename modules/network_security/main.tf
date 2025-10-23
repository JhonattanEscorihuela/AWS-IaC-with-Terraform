# Create a Security Group for SSH
resource "aws_security_group" "cmtr_sg_ssh" {
  name        = var.security_group_name_ssh
  description = "Security group for SSH and HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }




}

# Create a Security Group for HTTP
resource "aws_security_group" "cmtr_http_sg" {
  name        = var.security_group_name_http
  description = "Security group for HTTP access"
  vpc_id      = var.vpc_id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }


}

# Create a Security Group for Private HTTP
resource "aws_security_group" "cmtr_private_http_sg" {
  name        = var.security_group_name_http_private
  description = "Security group for Private HTTP access"
  vpc_id      = var.vpc_id



  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.cmtr_http_sg.id]

  }

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [aws_security_group.cmtr_http_sg.id]
  }


}




