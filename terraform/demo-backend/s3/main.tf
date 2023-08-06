provider "aws" {
  region = var.apne2
}

resource "aws_s3_bucket" "backend-bucket" {
  bucket = var.s3_name

  tags = {
    Name = "devops-default-backend"
    Env  = "Demo"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example_lifecycle" {
  bucket = aws_s3_bucket.backend-bucket.id
  rule {
    id     = "backup-rule"
    status = "Enabled"
    prefix = "backup/" # 백업 폴더를 지정하여 해당 폴더에 저장된 객체만 백업 대상으로 설정

    # 객체가 생성된 후 7일이 지나면 Glacier 스토리지 클래스로 이동
    transition {
      days          = 7
      storage_class = "GLACIER"
    }

    # 객체가 생성된 후 3650일이 지나면 객체 삭제하지 않고 Glacier 스토리지 클래스로만 이동 (백업 보존)
    expiration {
      days = 3650
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.backend-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.backend-bucket.id
  acl    = "private"
}

