# ----------------------------------------------------------------------------------------------------------------
# Main VPC network resource
# ----------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-vpc-main"
  })
}

# ----------------------------------------------------------------------------------------------------------------
# Internet Gateway for allowing to accept and go out traffic
# ----------------------------------------------------------------------------------------------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-igw"
  })
}

