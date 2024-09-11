module "vpc" {
  source = "../module"

  project            = var.project
  env                = "stag"
  aws_region         = var.aws_region
  azs                = var.azs
  cidr_second_number = 1
  vpc_name           = "${var.project}_stag_vpc"
}
