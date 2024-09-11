# ----------------------------------------------------------------------------------------------------------------
# Register IP addresss for allowing to access to Bastion Host
# `X.X.X.X/32` only allows specific IP address, not in range.
# ----------------------------------------------------------------------------------------------------------------
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

