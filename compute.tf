# Create a EC2 instance in public subnet with data source
resource "aws_instance" "my_intance" {
  instance_type   = "t2.micro"
  subnet_id       = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  security_groups = [data.terraform_remote_state.base_infra.outputs.security_group_id]
  ami             = "ami-0023921b4fcd5382b"
  tags            = var.common_tags
}
