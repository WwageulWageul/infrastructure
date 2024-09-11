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
  value = aws_vpc.main
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "public_subnet_cidr_blocks" {
  value = aws_subnet.public[*].cidr_block
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "private_subnet_cidr_blocks" {
  value = aws_subnet.private[*].cidr_block
}

output "isolated_private_subnet_ids" {
  value = aws_subnet.isolated_private[*].id
}

output "isolated_private_subnet_cidr_blocks" {
  value = aws_subnet.isolated_private[*].cidr_block
}

