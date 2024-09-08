# ----------------------------------------------------------------------------------------------------------------
# Private Subnet and associated resources
# ----------------------------------------------------------------------------------------------------------------
resource "aws_subnet" "private" {
  count      = length(var.azs)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-subnet-private${count.index}"
  })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-rt-private"
  })
}

resource "aws_route_table_association" "private" {
  count = length(var.azs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}


