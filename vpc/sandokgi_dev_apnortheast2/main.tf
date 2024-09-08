module "vpc" {
  source = "../modules/vpc"

  project                             = "sandoki"
  env                                 = "dev"
  aws_region                          = "ap-northeast-2"
  azs                                 = ["ap-northeast-2a"]
  allowed_cidr_blocks_to_bastion_host = ["0.0.0.0/0"]
  # azs        = ["ap-northeast-2a", "ap-northeast-2c"]
  vpc_name = "sandoki_dev_vpc"

  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = [
    "10.0.1.0/24",
    # "10.0.2.0/24",
    # "10.0.3.0/24",
  ]
  private_subnet_cidr_blocks = [
    "10.0.51.0/24",
    # "10.0.52.0/24",
    # "10.0.53.0/24",
  ]
  isolated_private_subnet_cidr_blocks = [
    "10.0.101.0/24",
    # "10.0.102.0/24",
    # "10.0.103.0/24",
  ]
}
