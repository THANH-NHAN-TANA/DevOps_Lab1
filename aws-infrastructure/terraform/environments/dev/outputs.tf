 output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_instance_public_ip" {
  description = "Public IP of the public EC2 instance"
  value       = module.ec2.public_instance_public_ip
}

output "private_instance_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = module.ec2.private_instance_private_ip
} 