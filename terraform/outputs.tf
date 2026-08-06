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
