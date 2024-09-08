module "vpc" {
  source = "../modules/vpc"

  project                             = "sandoki"
  env                                 = "stag"
  aws_region                          = "ap-northeast-2"
  azs                                 = ["ap-northeast-2a"]
  allowed_cidr_blocks_to_bastion_host = ["0.0.0.0/0"]
  vpc_name                            = "sandoki_stag_vpc"

  vpc_cidr_block = "10.2.0.0/16"
  public_subnet_cidr_blocks = [
    "10.2.0.0/24",
  ]
  private_subnet_cidr_blocks = [
    "10.2.51.0/24",
  ]
  isolated_private_subnet_cidr_blocks = [
    "10.2.101.0/24",
  ]
}
