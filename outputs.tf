# Outputs

# VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# VPC CIDR
output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

# Public Subnet IDs
output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}