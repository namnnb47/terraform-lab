output "public_sg" {
  description = "The ID of the Bastion Security Group"
  value       = aws_security_group.public_sg.id
}

output "private_sg" {
  description = "The ID of the Private Security Group"
  value       = aws_security_group.private_sg.id
}

output "alb_sg" {
  description = "The ID of the Private Security Group"
  value       = aws_security_group.alb_sg.id
}

output "db_sg" {
  description = "The ID of the Private Security Group"
  value       = aws_security_group.db_sg.id
}

