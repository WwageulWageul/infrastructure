module "vpc" {
  source = "../module"

  project            = var.project
  env                = "prod"
  aws_region         = var.aws_region
  azs                = var.azs
  cidr_second_number = 2
  # azs        = ["ap-northeast-2a", "ap-northeast-2c"]
  vpc_name = "${var.project}_prod_vpc"

}
