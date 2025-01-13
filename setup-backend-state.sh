#!/bin/bash

# Biến cấu hình
AWS_REGION="us-east-1"  # Vùng AWS
BUCKET_NAME="terraform-lab-backend-bucket"  # Tên S3 bucket
DYNAMO_TABLE_NAME="terraform-lab-locks"  # Tên DynamoDB table

# Tạo S3 bucket
echo "Creating S3 bucket: $BUCKET_NAME in region: $AWS_REGION..."
aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$AWS_REGION" \
    --create-bucket-configuration LocationConstraint="$AWS_REGION"

echo "Enabling versioning for S3 bucket: $BUCKET_NAME..."
aws s3api put-bucket-versioning \
    --bucket "$BUCKET_NAME" \
    --versioning-configuration Status=Enabled

echo "Enabling default encryption for S3 bucket: $BUCKET_NAME..."
aws s3api put-bucket-encryption \
    --bucket "$BUCKET_NAME" \
    --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

echo "S3 bucket $BUCKET_NAME created and configured successfully."

# Tạo DynamoDB table
echo "Creating DynamoDB table: $DYNAMO_TABLE_NAME in region: $AWS_REGION..."
aws dynamodb create-table \
    --table-name "$DYNAMO_TABLE_NAME" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$AWS_REGION"

echo "Waiting for DynamoDB table to be active..."
aws dynamodb wait table-exists --table-name "$DYNAMO_TABLE_NAME" --region "$AWS_REGION"

echo "DynamoDB table $DYNAMO_TABLE_NAME created successfully."
