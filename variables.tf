# Region for AWS resources
variable "aws_region" {
  description = "Región de AWS para desplegar la infraestructura."
  type        = string
}

# Required version
variable "required_version" {
  description = "Required version to deploy resources"
  type        = string
  default     = ">=1.5.7"
}

variable "allowed_ip_range" {
  description = "List of IP address ranges allowed to access SSH and HTTP"
  type        = list(string)
}
