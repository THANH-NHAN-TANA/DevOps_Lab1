# VPC Module

This module creates a VPC with public and private subnets, along with necessary networking components.

## Components

- VPC with DNS support
- Internet Gateway
- NAT Gateway with Elastic IP
- Public Subnets
- Private Subnets
- Route Tables for both subnet types

## Usage

```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  environment          = "dev"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_cidr | CIDR block for VPC | string | n/a | yes |
| public_subnet_cidrs | CIDR blocks for public subnets | list(string) | n/a | yes |
| private_subnet_cidrs | CIDR blocks for private subnets | list(string) | n/a | yes |
| environment | Environment name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the VPC |
| public_subnet_ids | IDs of the public subnets |
| private_subnet_ids | IDs of the private subnets |
| nat_gateway_ip | Public IP of the NAT Gateway | 