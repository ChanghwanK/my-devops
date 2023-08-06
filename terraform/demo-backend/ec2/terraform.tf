terraform {
  backend "s3" {
    bucket  = "demo-s3-backend-bucket"
    key     = "terraform/ec2/terraform.tfstate"
    region  = "ap-northeast-2"
    encrypt = true
  }
}


provider "aws" {
  region = var.apne2
}
