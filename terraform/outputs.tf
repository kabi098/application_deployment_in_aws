output "fetched_vpc_id" {
  description = "The default VPC ID fetched from AWS"
  value       = data.aws_vpc.main.id
}

output "fetched_subnet_ids" {
  description = "The subnet IDs fetched from the default VPC"
  value       = data.aws_subnets.main.ids
}

output "fetched_internet_gateway_id" {
  description = "The internet gateway ID fetched from the default VPC"
  value       = data.aws_internet_gateway.main.id
}

output "fetched_alb_arn" {
  description = "The ALB ARN fetched from AWS by name"
  value       = data.aws_lb.main.arn
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.main.dns_name
}

output "ecr_backend_url" {
  description = "Repository URL for the backend container image"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_url" {
  description = "Repository URL for the frontend container image"
  value       = aws_ecr_repository.frontend.repository_url
}
