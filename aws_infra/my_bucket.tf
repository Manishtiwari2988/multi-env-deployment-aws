# My S3 Bucket

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.my_env}-application-bucket-2026"
  tags = {
    Environment = var.my_env
    Name        = "${var.my_env}-application-bucket-2026"

  }
}

