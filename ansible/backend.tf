terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "vijay-devops-app-bucket-2026"
    key    = "prod/terraform.tfstate"
  }
}
