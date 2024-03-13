output "role_arn" {
  value = aws_iam_role.prasanth_role.arn
}

output "role_name" {
  value = aws_iam_role.prasanth_role.name
}

output "policy_arn" {
  value = aws_iam_policy.prasanth_policy.arn
}

output "policy_name" {
  value = aws_iam_policy.prasanth_policy.name
}

output "bucket_name" {
  value = aws_s3_bucket.prasanth_bucket.id
}


