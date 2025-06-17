#!/bin/bash

# Lấy thông tin từ Terraform output
PUBLIC_IP=$(terraform output -raw public_instance_public_ip)
PRIVATE_IP=$(terraform output -raw private_instance_private_ip)
KEY_PATH="your-key.pem"  # Thay thế bằng đường dẫn đến key của bạn

# Test SSH vào public instance
echo "Testing SSH connection to public instance..."
ssh -i $KEY_PATH -o StrictHostKeyChecking=no ec2-user@$PUBLIC_IP "echo 'Successfully connected to public instance'"

# Test SSH từ public instance vào private instance
echo "Testing SSH connection from public to private instance..."
ssh -i $KEY_PATH -o StrictHostKeyChecking=no ec2-user@$PUBLIC_IP "ssh -i $KEY_PATH -o StrictHostKeyChecking=no ec2-user@$PRIVATE_IP 'echo Successfully connected to private instance'"

# Test internet connectivity từ private instance
echo "Testing internet connectivity from private instance..."
ssh -i $KEY_PATH -o StrictHostKeyChecking=no ec2-user@$PUBLIC_IP "ssh -i $KEY_PATH -o StrictHostKeyChecking=no ec2-user@$PRIVATE_IP 'curl -s ifconfig.me'" 