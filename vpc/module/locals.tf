locals {
  vpc_network_bits = "10.${var.cidr_second_number}"
  vpc_cidr_block   = "${local.vpc_network_bits}.0.0/16"

  public_subnet_cidr_blocks = [
    for idx, az in var.azs
    : "${local.vpc_network_bits}.${idx + 1}.0/24"
  ]

  private_subnet_cidr_blocks = [
    for idx, az in var.azs
    : "${local.vpc_network_bits}.${idx + 51}.0/24"
  ]

  isolated_private_subnet_cidr_blocks = [
    for idx, az in var.azs
    : "${local.vpc_network_bits}.${idx + 101}.0/24"
  ]

  ssm_accessible_subnet_ids = concat(
    aws_subnet.private[*].id,
    aws_subnet.isolated_private[*].id,
  )
  # variable "vpc_cidr_block" {
  #   type        = string
  #   description = "CIDR block for the VPC"

  #   validation {
  #     condition     = can(cidrhost(var.vpc_cidr_block, 0))
  #     error_message = "Invalid VPC CIDR block"
  #   }
  # }

  # variable "public_subnet_cidr_blocks" {
  #   type        = list(string)
  #   description = "CIDR block for the public subnet"

  #   validation {
  #     condition = alltrue([
  #       for cidr_block in var.public_subnet_cidr_blocks :
  #       can(cidrhost(cidr_block, 0))
  #     ])
  #     error_message = "Invalid public subnet CIDR block"
  #   }
  # }

  # variable "private_subnet_cidr_blocks" {
  #   type        = list(string)
  #   description = "CIDR block for the private subnet"

  #   validation {
  #     condition = alltrue([
  #       for cidr_block in var.private_subnet_cidr_blocks :
  #       can(cidrhost(cidr_block, 0))
  #     ])
  #     error_message = "Invalid private subnet CIDR block"
  #   }
  # }

  # variable "isolated_private_subnet_cidr_blocks" {
  #   type        = list(string)
  #   description = "CIDR block for the isolated private subnet"

  #   validation {
  #     condition = alltrue([
  #       for cidr_block in var.isolated_private_subnet_cidr_blocks :
  #       can(cidrhost(cidr_block, 0))
  #     ])
  #     error_message = "Invalid isolated private subnet CIDR block"
  #   }
  # }




}
