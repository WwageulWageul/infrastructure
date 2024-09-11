module "iam" {
  source = "../module"

  account_id               = var.account_id
  remote_state_bucket_name = local.remote_state_bucket_name
}
