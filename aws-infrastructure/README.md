# AWS Infrastructure with Terraform

Dự án này triển khai cơ sở hạ tầng AWS sử dụng Terraform, bao gồm VPC, subnets, NAT Gateway và EC2 instances trong cả public và private subnets.

## Cấu trúc dự án

```
aws-infrastructure/
├── terraform/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── security-groups/
│   │   └── ec2/
│   ├── environments/
│   │   └── dev/
│   ├── scripts/
│   └── tests/
├── cloudformation/
│   ├── templates/
│   └── scripts/
└── docs/
```

## Yêu cầu

- AWS CLI đã được cấu hình với credentials phù hợp
- Terraform (phiên bản >= 0.12)
- SSH key pair đã được tạo trong AWS

## Cài đặt

1. Cấu hình AWS credentials:
   ```bash
   aws configure
   ```

2. Cập nhật file `terraform/environments/dev/terraform.tfvars`:
   ```hcl
   aws_region = "ap-southeast-1"
   environment = "dev"
   my_ip = "125.235.233.192/32"
   key_name = "your-key-name"  # Thay thế bằng tên key pair của bạn
   ```

3. Triển khai infrastructure:
   ```bash
   cd terraform/scripts
   ./deploy.sh
   ```

## Kiểm tra

Sau khi triển khai, bạn có thể kiểm tra cơ sở hạ tầng:

```bash
cd terraform/scripts
./test.sh
```

## Các thành phần

- VPC với public và private subnets
- Internet Gateway cho public subnet
- NAT Gateway cho private subnet
- Security groups cho EC2 instances
- EC2 instances trong cả public và private subnets

## Bảo mật

- Public EC2 instances chỉ có thể truy cập SSH từ IP của bạn
- Private EC2 instances chỉ có thể truy cập từ public EC2 instances
- Tất cả các instance đều có thể kết nối ra internet

## Dọn dẹp

Để xóa tất cả tài nguyên đã tạo:
```bash
cd terraform/environments/dev
terraform destroy
```

## Lưu ý

- NAT Gateway được đặt trong public subnet đầu tiên
- EC2 instances được đặt trong subnet đầu tiên của mỗi loại
- Sử dụng Amazon Linux 2 AMI cho tất cả các EC2 instances 