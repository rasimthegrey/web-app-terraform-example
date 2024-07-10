output "vpc_id" {
    description = "ID of the VPC"
    value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public_2.id
}

output "private_subnet_1_id" {
  description = "The ID of the first private subnet"
  value = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  description = "The ID of the second private subnet"
  value = aws_subnet.private_2.id
}