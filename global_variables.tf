variable "project" {
  type        = string
  description = "project name"
}

variable "env" {
  type        = string
  description = "environment of the resources"

  validation {
    condition     = contains(["dev", "stag", "qa", "prod"], var.env)
    error_message = "`env` must be one of `dev`, `stag`, `qa`, `prod`"
  }
}

variable "aws_region" {
  type        = string
  description = "region of the resources"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "name of the VPC"
}



