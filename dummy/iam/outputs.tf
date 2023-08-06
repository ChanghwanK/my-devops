output "user_names" {
  value = values(aws_iam_user.example)[*].name
}

output "all_user_arns" {
  value = values(aws_iam_user.example)[*].arn
}