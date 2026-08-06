variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

variable "frontend_image" {
  description = "Container image for frontend"
  type        = string
  default     = "nginx:latest"
}

variable "backend_image" {
  description = "Container image for backend"
  type        = string
  default     = "node:20-alpine"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "cld400admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
  default     = "ChangeMe123!"
}
