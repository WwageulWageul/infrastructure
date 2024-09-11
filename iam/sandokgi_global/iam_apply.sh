#!/bin/bash

export ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

echo "applying with AWS account_id: $ACCOUNT_ID"

terraform apply -var="account_id=${ACCOUNT_ID}"
