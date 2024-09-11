output "project" {
  value = var.project
}

output "env" {
  value = var.env
}

output "aws_region" {
  value = var.aws_region
}

output "vpc" {
  value = module.vpc.vpc
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "public_subnet_cidr_blocks" {
  value = module.vpc.public_subnet_cidr_blocks
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "private_subnet_cidr_blocks" {
  value = module.vpc.private_subnet_cidr_blocks
}

output "isolated_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "isolated_private_subnet_cidr_blocks" {
  value = module.vpc.isolated_private_subnet_cidr_blocks
}
