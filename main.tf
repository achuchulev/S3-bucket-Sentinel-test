provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "nikolay"
  acl    = "private"

  tags = {
    Name        = "nikolay"
    Environment = "dev"
  }
}


