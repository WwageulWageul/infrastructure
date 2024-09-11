module "vpc" {
  source = "../module"

  project            = var.project
  env                = "dev"
  aws_region         = var.aws_region
  azs                = var.azs
  cidr_second_number = 0
  vpc_name           = "${var.project}_dev_vpc"
}
