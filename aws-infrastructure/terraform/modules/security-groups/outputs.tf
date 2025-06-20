output "public_sg_id" {
  description = "ID of the public security group"
  value       = aws_security_group.public.id
}

output "private_sg_id" {
  description = "ID of the private security group"
  value       = aws_security_group.private.id
} 