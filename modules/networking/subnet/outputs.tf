output "public_subnet_1" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.private_subnet_2.id
}

output "trust_subnet_1" {
  description = "The ID of the first trust subnet"
  value       = aws_subnet.private_subnet_1.id
}

output "trust_subnet_2" {
  description = "The ID of the second trust subnet"
  value       = aws_subnet.private_subnet_2.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "trust_subnet_ids" {
  description = "The IDs of the trust subnets"
  value       = [aws_subnet.trust_subnet_1.id, aws_subnet.trust_subnet_2.id]
}
