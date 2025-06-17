# EC2 Module

This module creates EC2 instances in public and private subnets.

## Components

- Public EC2 Instance
  - Amazon Linux 2 AMI
  - Located in public subnet
  - Accessible via SSH from specified IP
- Private EC2 Instance
  - Amazon Linux 2 AMI
  - Located in private subnet
  - Accessible via SSH from public instance

## Usage

```hcl
module "ec2" {
  source = "./modules/ec2"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  public_sg_id       = module.security_groups.public_sg_id
  private_sg_id      = module.security_groups.private_sg_id
  key_name          = "your-key-name"
  instance_type     = "t2.micro"
  environment       = "dev"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_id | ID of the VPC | string | n/a | yes |
| public_subnet_ids | IDs of the public subnets | list(string) | n/a | yes |
| private_subnet_ids | IDs of the private subnets | list(string) | n/a | yes |
| public_sg_id | ID of the public security group | string | n/a | yes |
| private_sg_id | ID of the private security group | string | n/a | yes |
| key_name | Name of the SSH key pair | string | n/a | yes |
| instance_type | EC2 instance type | string | n/a | yes |
| environment | Environment name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| public_instance_id | ID of the public EC2 instance |
| public_instance_private_ip | Private IP of the public EC2 instance |
| public_instance_public_ip | Public IP of the public EC2 instance |
| private_instance_id | ID of the private EC2 instance |
| private_instance_private_ip | Private IP of the private EC2 instance | 