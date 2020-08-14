output "s3_access_role_arn" {
  value = aws_iam_role.s3_access_role.arn
}

output "s3_access_role_name" {
  value = aws_iam_role.s3_access_role.name
}