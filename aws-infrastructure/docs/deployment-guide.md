# Deployment Guide

## Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform installed
- SSH key pair created in AWS

## Deployment Steps

### Using Terraform
1. Navigate to the terraform directory:
   ```bash
   cd terraform/scripts
   ```

2. Run the deployment script:
   ```bash
   ./deploy.sh
   ```

### Using CloudFormation
1. Navigate to the cloudformation directory:
   ```bash
   cd cloudformation/scripts
   ```

2. Deploy VPC stack:
   ```bash
   ./deploy-cf.sh vpc-stack ../templates/vpc-stack.yaml "Environment=dev VpcCidr=10.0.0.0/16"
   ```

3. Deploy Security Groups stack:
   ```bash
   ./deploy-cf.sh security-groups-stack ../templates/security-groups-stack.yaml "Environment=dev VpcId=<vpc-id> MyIp=<your-ip>"
   ```

4. Deploy EC2 stack:
   ```bash
   ./deploy-cf.sh ec2-stack ../templates/ec2-stack.yaml "Environment=dev PublicSubnet=<public-subnet-id> PrivateSubnet=<private-subnet-id> KeyName=<key-name>"
   ```

## Testing
Run the test suite:
```bash
cd terraform/tests
go test -v
```

## Cleanup
To remove all resources:
```bash
# Terraform
cd terraform/environments/dev
terraform destroy

# CloudFormation
aws cloudformation delete-stack --stack-name ec2-stack
aws cloudformation delete-stack --stack-name security-groups-stack
aws cloudformation delete-stack --stack-name vpc-stack
```
