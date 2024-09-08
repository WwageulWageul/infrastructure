# locals {
#   aws_region     = "ap-northeast-2"
#   vpc_cidr_block = "10.0.0.0/16"
#   subnet_cidr_blocks = {
#     public = [
#       "10.0.0.0/24",
#       "10.0.1.0/24",
#       # "10.0.2.0/24",
#       # "10.0.3.0/24",
#     ]
#     private = [
#       "10.0.50.0/24",
#       "10.0.51.0/24",
#       # "10.0.52.0/24",
#       # "10.0.53.0/24",
#     ]
#     isolated_private = [
#       "10.0.100.0/24",
#       "10.0.101.0/24",
#       # "10.0.102.0/24",
#       # "10.0.103.0/24",
#     ]
#   }

#   common_tags = {

#   }
#   name_tag_prefix = "${var.project}-${var.env}"
# }
