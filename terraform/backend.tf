terraform {
  backend "s3" {
    bucket         = "cld400-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "cld400-terraform-lock"
  }
}
