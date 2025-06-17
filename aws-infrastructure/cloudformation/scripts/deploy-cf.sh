#!/bin/bash
set -e

STACK_NAME=$1
TEMPLATE_FILE=$2
PARAMETERS=$3

aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file $TEMPLATE_FILE \
  --parameter-overrides $PARAMETERS \
  --capabilities CAPABILITY_IAM
