# ----------------------------------------------------------------------------------------------------------------
# terraform remote state s3 bucket
# ----------------------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 1.9.0"

  backend "s3" {
    bucket         = "sandokgi-apnortheast2-terraform-remote-state"
    key            = "sandokgi/terraform/vpc/sandokgi_dev_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
