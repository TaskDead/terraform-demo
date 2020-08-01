resource "aws_s3_bucket" "test_bucket" {
  bucket = "${var.app_name}-${var.env}-zfgh"
  acl    = "private"

  tags = {
    Environment = var.env
  }
}
