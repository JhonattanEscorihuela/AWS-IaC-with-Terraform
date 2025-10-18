resource "aws_instance" "web_server" {
  ami             = data.aws_ami.amazon_linux_2023.id
  instance_type   = var.instance_type
  subnet_id       = data.aws_subnet.public.id
  security_groups = [data.aws_security_group.selected.id]

  tags = merge(var.common_tags, {
    Name = var.instance_name
  })
}
