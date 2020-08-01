output "bucket_domain_name" {
  value = aws_s3_bucket.test_bucket.bucket_domain_name
}

output "bucket_arn" {
  value = aws_s3_bucket.test_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.test_bucket.id
}