variable "project" {
  type        = string
  description = "project name"
  default     = "sandokgi"
}

variable "env" {
  type        = string
  description = "environment of the resources"

  validation {
    condition     = contains(["dev", "stag", "prod"], var.env)
    error_message = "`env` must be one of `dev`, `stag`, `prod`"
  }
}

variable "aws_region" {
  type        = string
  description = "region of the resources"
  default     = "ap-northeast-2"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for the VPC"
  default     = ["ap-northeast-2a"]
}


