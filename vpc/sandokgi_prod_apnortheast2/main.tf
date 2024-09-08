module "vpc" {
  source = "../modules/vpc"

  project                             = var.project
  env                                 = "prod"
  aws_region                          = var.aws_region
  azs                                 = var.azs
  vpc_name                            = "${var.project}_prod_vpc"
  allowed_cidr_blocks_to_bastion_host = var.allowed_cidr_blocks_to_bastion_host

  vpc_cidr_block = "10.1.0.0/16"
  public_subnet_cidr_blocks = [
    "10.1.1.0/24",
    "10.1.2.0/24",
  ]
  private_subnet_cidr_blocks = [
    "10.1.51.0/24",
    "10.1.52.0/24",
  ]
  isolated_private_subnet_cidr_blocks = [
    "10.1.101.0/24",
    "10.1.102.0/24",
  ]
}
