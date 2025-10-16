
resource "aws_key_pair" "cmtr_keypair" {
  key_name   = var.ssh_name
  public_key = var.ssh_key

  tags = var.instance_tags
}

