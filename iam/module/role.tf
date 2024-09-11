# ----------------------------------------------------------------------------------------------------------------
#
# Assume Role for Remote State
#
# ----------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "remote_state" {
  name = "remote-state-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "remote_state" {
  name = "remote-state-access-policy"
  role = aws_iam_role.remote_state.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.remote_state_bucket_name}",
          "arn:aws:s3:::${var.remote_state_bucket_name}/*"
        ]
      }
    ]
  })
}

# ----------------------------------------------------------------------------------------------------------------
#
# SSM Role, Policy are a global resource
#
# it can be reused in many regions
# but the instance profile and VPC endpoint must be redefined in each region.
# because they're region specific resources.
#
# SSM is recommended way to connect to resources in private subnets
# Unlike a Bastion Host, SSM does not require opening inbound ports,
# making it more advantageous for security.
#
# ----------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "ssm" {
  name = "ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm" {
  name = "ssm-profile"
  role = aws_iam_role.ssm.name
}


