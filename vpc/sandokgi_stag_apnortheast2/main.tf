module "vpc" {
  source = "../modules/vpc"

  project                             = var.project
  env                                 = "stag"
  aws_region                          = var.aws_region
  azs                                 = var.azs
  allowed_cidr_blocks_to_bastion_host = var.allowed_cidr_blocks_to_bastion_host
  vpc_name                            = "${var.project}_stag_vpc"

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
