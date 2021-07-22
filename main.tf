provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "mykey" {
  description             = "KKMS key"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "test" {
  bucket = "nikolay-test-bucket"
  acl    = "private"

  tags = {
    Name        = "nikolay-test-bucket"
    Environment = "dev"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


