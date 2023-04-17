#OUTPUTS

output "my_s3_versioning" {
  value = aws_s3_bucket.my_bucket.versioning[0].enabled
}

output "my_s3_full_details" {
    value = aws_s3_bucket.my_bucket
}

output "my_iam_user" {
    value = aws_iam_user.my_user
}