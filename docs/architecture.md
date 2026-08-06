# Architecture Notes

## 1. Current architecture analysis

The initial setup uses three services (frontend, backend, Redis) with Docker Compose on a single Ubuntu server. This works for development but creates operational risk because:

- a single host failure can take down the whole stack
- manual SSH access makes updates slow and error-prone
- no monitoring or alerting means outages are discovered late
- the current model does not scale well for traffic growth

## 2. Recommended container service

Amazon ECS on Fargate is a strong fit because it:

- runs containers without managing EC2 instances
- integrates well with AWS networking, ALB, IAM, and CloudWatch
- supports automatic scaling and service-based deployments
- fits a migration path from Docker Compose to AWS-managed containers

## 3. AWS architecture design

The Terraform prototype models the following:

- VPC with public and private subnets
- Application Load Balancer in public subnets
- ECS Fargate services for frontend and backend in private subnets
- ECR repositories for container images
- CloudWatch log groups for monitoring
- RDS PostgreSQL and ElastiCache Redis as managed data services

## 4. Deployment strategy

1. Build container images locally or in CI.
2. Push images to Amazon ECR.
3. Update ECS task definitions and services.
4. Use rolling deployments so new tasks come up before old ones are removed.
5. Monitor via CloudWatch and ALB health checks.

## 5. Scaling approach

- Scale ECS services horizontally by increasing desired task count.
- Add ALB target groups and multiple tasks behind each service.
- Use autoscaling based on CPU and memory metrics.
- Move to managed database/Redis instances that can be resized as needed.
