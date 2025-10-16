
resource "aws_key_pair" "cmtr_mg0vmvp0_keypair" {
  key_name   = "cmtr-mg0vmvp0-keypair"
  public_key = var.ssh_key
}
