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

# A set of CIDR's block for all public subnets
output "public_subnet_cidr_block" {
  description = "Public Subnet CIDRs"
  value       = [for subnet in aws_subnet.public_subnets : subnet.cidr_block]
}

# A set of AZ's for all public subnets
output "public_subnet_availability_zone" {
  description = "Public Subnet AZs"
  value       = [for subnet in aws_subnet.public_subnets : subnet.availability_zone]
}

# The unique identifier of the Internet Gateway
output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

# The unique identifier of the routing table
output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.public_rt.id
}