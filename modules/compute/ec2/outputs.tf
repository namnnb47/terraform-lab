output "terraform-lab-server" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.terraform-lab-server[*].private_ip
}

output "bastion" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.bastion.public_ip
}
