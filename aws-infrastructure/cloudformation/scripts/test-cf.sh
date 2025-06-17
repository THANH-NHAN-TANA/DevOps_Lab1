#!/bin/bash
set -e

STACK_NAME=$1

aws cloudformation describe-stacks \
  --stack-name $STACK_NAME \
  --query 'Stacks[0].Outputs'
