# ----------------------------------------------------------------------------------------------------------------
# Isolated Private Subnet and associated resources
# ----------------------------------------------------------------------------------------------------------------
resource "aws_subnet" "isolated_private" {
  count = length(var.azs)

  vpc_id            = aws_vpc.main.id
  availability_zone = element(var.azs, count.index)
  cidr_block        = element(var.isolated_private_subnet_cidr_blocks, count.index)
}

resource "aws_route_table" "isolated_private" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-rt-isolated_private"
  })
}

resource "aws_route_table_association" "isolated_private" {
  count = length(var.azs)

  subnet_id      = aws_subnet.isolated_private[count.index].id
  route_table_id = aws_route_table.isolated_private.id
}
