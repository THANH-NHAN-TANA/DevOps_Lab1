#!/bin/bash

# Di chuyển vào thư mục dev
cd environments/dev

# Khởi tạo Terraform
terraform init

# Kiểm tra cấu hình
terraform plan

# Triển khai infrastructure
terraform apply -auto-approve

# Hiển thị outputs
terraform output 