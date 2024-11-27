output "ig_id" {
  description = "The IDs of the IG"
  value       = aws_internet_gateway.igw.id
}

output "nat_id" {
  description = "The IDs of the NAT"
  value       = aws_nat_gateway.nat.id
}
