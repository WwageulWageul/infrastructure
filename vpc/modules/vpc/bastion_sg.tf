# ----------------------------------------------------------------------------------------------------------------
# bastion host's security group
# ----------------------------------------------------------------------------------------------------------------
resource "aws_security_group" "bastion" {
  name        = "${local.name_tag_prefix}-sg_bastion"
  description = "Allows SSH access to the bastion server"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.allowed_cidr_blocks_to_bastion_host
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-sg_bastion"
  })
}

# ----------------------------------------------------------------------------------------------------------------
# Security group for allowing inbound traffic from bastion host
# attach it to any resources accepting traffic from bastion host
# ----------------------------------------------------------------------------------------------------------------
resource "aws_security_group" "bastion_aware" {
  name        = "${local.name_tag_prefix}-sg_bastion_aware"
  description = "Allows SSH access from the bastion server"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_tag_prefix}-sg_bastion_aware"
  })
}
