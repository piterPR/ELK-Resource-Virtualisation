provider "aws" {
}

resource "aws_s3_bucket" "logstach-backend-app" {
  bucket = "logstach-backend-app"
  acl    = "private"

  
  tags = {
    Name        = "My test bucket for logstach"
    Environment = "Dev"
  }
}