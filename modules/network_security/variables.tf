# Name of Security group for ssh
variable "security_group_name_ssh" {
  description = "Name of the Security Group"
  type        = string
  default     = "cmtr-mg0vmvp0-ssh-sg"
}

# Name of HTTP Security group
variable "security_group_name_http" {
  description = "Name of the HTTP Security Group"
  type        = string
  default     = "cmtr-mg0vmvp0-public-http-sg"
}

# Name of Private HTTP Security Group
variable "security_group_name_http_private" {
  description = "Name of the Private HTTP Security Group"
  type        = string
  default     = "cmtr-mg0vmvp0-private-http-sg"
}

variable "allowed_ip_range" {
  description = "List of IP address ranges allowed to access SSH and HTTP"
  type        = list(string)
}

variable "vpc_id" {
  type = string
}
