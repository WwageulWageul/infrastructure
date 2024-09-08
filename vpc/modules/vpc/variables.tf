variable "allowed_cidr_blocks_to_bastion_host" {
  type        = list(string)
  description = "CIDR blocks of the members of the project for allowing access to bastion host"

  validation {
    condition = alltrue([
      for cidr_block in var.allowed_cidr_blocks_to_bastion_host :
      can(cidrhost(cidr_block, 0))
    ])
    error_message = "Invalid CIDR blocks to bastion host"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC network"

  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "Invalid VPC CIDR block"
  }
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR block for the public subnet"

  validation {
    condition = alltrue([
      for cidr_block in var.public_subnet_cidr_blocks :
      can(cidrhost(cidr_block, 0))
    ])
    error_message = "Invalid public subnet CIDR block"
  }
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR block for the private subnet"

  validation {
    condition = alltrue([
      for cidr_block in var.private_subnet_cidr_blocks :
      can(cidrhost(cidr_block, 0))
    ])
    error_message = "Invalid private subnet CIDR block"
  }
}

variable "isolated_private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR block for the isolated private subnet"

  validation {
    condition = alltrue([
      for cidr_block in var.isolated_private_subnet_cidr_blocks :
      can(cidrhost(cidr_block, 0))
    ])
    error_message = "Invalid isolated private subnet CIDR block"
  }
}


