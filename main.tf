provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "nikolay-test-bucket"
  acl    = "private"

  tags = {
    Name        = "nikolay-test-bucket"
    Environment = "dev"
  }
}


