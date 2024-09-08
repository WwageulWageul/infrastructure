output "project" {
  value = var.project
}

output "env" {
  value = var.env
}

output "aws_region" {
  value = var.aws_region
}

output "public_subnet_cidr_blocks" {
  value = aws_subnet.public[*].cidr_block
}

output "private_subnet_cidr_blocks" {
  value = aws_subnet.private[*].cidr_block
}

output "isolated_private_subnet_cidr_blocks" {
  value = aws_subnet.isolated_private[*].cidr_block
}
