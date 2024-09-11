variable "vpc_name" {
  type        = string
  description = "VPC name of the network"
}

variable "cidr_second_number" {
  type        = number
  description = "Second number of network CIDR block"

  validation {
    condition     = var.cidr_second_number >= 0 && var.cidr_second_number <= 255
    error_message = "CIDR second number must be in range 0 ~ 255"
  }
}

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


