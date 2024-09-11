output "ssm_role" {
  value       = aws_iam_role.ssm
  description = "Role for SSM"
}

output "remote_state_role" {
  value       = aws_iam_role.remote_state
  description = "Role for accessing S3 remote state bucket"
}
