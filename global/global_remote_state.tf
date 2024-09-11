locals {

  remote_state_bucket_name = "sandokgi-apnortheast2-terraform-remote-state"

  remote_state = {
    vpc = {
      dev_apnortheast2 = {
        key = "sandokgi/terraform/vpc/sandokgi_dev_apnortheast2/terraform.tfstate"
      }
      stag_apnortheast2 = {
        key = "sandokgi/terraform/vpc/sandokgi_stag_apnortheast2/terraform.tfstate"
      }
      prodj_apnortheast2 = {
        key = "sandokgi/terraform/vpc/sandokgi_prod_apnortheast2/terraform.tfstate"
      }
    }
  }

  rds = {
    dev_apnortheast2 = {
      key = "sandokgi/terraform/rds/sandokgi_dev_apnortheast2/terraform.tfstate"
    }
    stag_apnortheast2 = {
      key = "sandokgi/terraform/rds/sandokgi_stag_apnortheast2/terraform.tfstate"
    }
    prodj_apnortheast2 = {
      key = "sandokgi/terraform/rds/sandokgi_prod_apnortheast2/terraform.tfstate"
    }
  }

  app = {
    dev_apnortheast2 = {
      key = "sandokgi/terraform/app/sandokgi_dev_apnortheast2/terraform.tfstate"
    }
    stag_apnortheast2 = {
      key = "sandokgi/terraform/app/sandokgi_stag_apnortheast2/terraform.tfstate"
    }
    prodj_apnortheast2 = {
      key = "sandokgi/terraform/app/sandokgi_prod_apnortheast2/terraform.tfstate"
    }
  }

  iam = {
    dev_apnortheast2 = {
      key = "sandokgi/terraform/iam/sandokgi_dev_apnortheast2/terraform.tfstate"
    }
    stag_apnortheast2 = {
      key = "sandokgi/terraform/iam/sandokgi_stag_apnortheast2/terraform.tfstate"
    }
    prod_apnortheast2 = {
      key = "sandokgi/terraform/iam/sandokgi_prod_apnortheast2/terraform.tfstate"
    }
  }

}







