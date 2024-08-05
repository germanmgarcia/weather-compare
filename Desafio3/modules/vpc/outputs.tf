output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "The IDs of the public subnets created."
}

output "subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.ig.id
  description = "The ID of the Internet Gateway."
}
