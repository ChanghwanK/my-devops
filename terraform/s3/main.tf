provider "aws" {
    region = var.provider_region
}

resource "aws_s3_bucket" "backend-bucket" {
  name = var.s3_name

  tags {
    Name = "devops-default-backend"
    Env = "Demo"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

