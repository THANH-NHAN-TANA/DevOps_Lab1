# Security Groups Module

This module creates security groups for public and private EC2 instances.

## Components

- Public Security Group
  - Allows SSH access from specified IP
  - Allows all outbound traffic
- Private Security Group
  - Allows SSH access from public instances
  - Allows all outbound traffic

## Usage

```hcl
module "security_groups" {
  source = "./modules/security-groups"

  vpc_id = module.vpc.vpc_id
  my_ip  = "YOUR_IP_ADDRESS/32"
  environment = "dev"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_id | ID of the VPC | string | n/a | yes |
| my_ip | Your IP address for SSH access | string | n/a | yes |
| environment | Environment name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| public_sg_id | ID of the public security group |
| private_sg_id | ID of the private security group | 