# CLD400 Project Prototype

This workspace includes a simple three-tier prototype for the architecture described in the assignment:

- Frontend: simple static UI served from Nginx
- Backend: Node.js API service
- Redis: local cache/service dependency via Docker Compose
- AWS infrastructure: Terraform for VPC, ECS Fargate, ALB, IAM, ECR, and CloudWatch log groups

## Quick start

### 1. Run locally with Docker Compose

```bash
docker compose up --build
```

Open:
- Frontend: http://localhost:3000
- Backend health: http://localhost:3001/health
- Backend API: http://localhost:3001/api/hello

### 2. Deploy to AWS with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Set the image values before applying if you want to use your own ECR images:

```hcl
backend_image = "123456789012.dkr.ecr.us-east-1.amazonaws.com/cld400-backend:latest"
frontend_image = "123456789012.dkr.ecr.us-east-1.amazonaws.com/cld400-frontend:latest"
```

## Project structure

- frontend/: simple static frontend app
- backend/: Node.js backend service
- terraform/: AWS infrastructure as code
- .github/workflows/: deployment workflow example
