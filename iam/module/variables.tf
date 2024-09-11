variable "account_id" {
  type        = string
  description = "Account id for grant access permission to remote state"
}

variable "remote_state_bucket_name" {
  type        = string
  description = "S3 bucket name for the remote state"
}
