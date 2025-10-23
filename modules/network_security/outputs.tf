output "security_group_id_ssh" {
  value = aws_security_group.cmtr_sg_ssh.id
}

output "security_group_id_http" {
  value = aws_security_group.cmtr_http_sg.id
}

output "security_group_id_http_private" {
  value = aws_security_group.cmtr_private_http_sg.id
}
