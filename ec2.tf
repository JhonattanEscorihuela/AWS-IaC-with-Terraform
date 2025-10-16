# Create a EC2 instance
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = values(aws_subnet.public_subnets)[0].id
  tags = merge(
    var.instance_tags,
    {
      Name = var.instance_name
    }
  )
  key_name        = aws_key_pair.cmtr_keypair.key_name
  security_groups = [aws_security_group.cmtr_sg.id]
}

resource "aws_security_group" "cmtr_sg" {
  name        = var.sg_name
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.26.140.98/32"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.instance_tags
}
