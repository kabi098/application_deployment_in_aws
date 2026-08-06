# Terraform backend setup

Before running Terraform, create the S3 bucket and DynamoDB table in AWS:

```bash
aws s3api create-bucket --bucket cld400-terraform-state --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-bucket-versioning --bucket cld400-terraform-state --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket cld400-terraform-state --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByRule":{"SSEAlgorithm":"AES256"}}]}'
aws dynamodb create-table \
  --table-name cld400-terraform-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region ap-south-1
```

Then run:

```bash
cd terraform
terraform init -migrate-state
```
