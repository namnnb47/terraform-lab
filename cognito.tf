module "cognito" {
  source                = "../../modules/application/cognito"
  user_pool_name        = "terraform-dev-user-pool-cdn"
  user_pool_client_name = "terraform-dev-app-client-cdn"
  tags                  = {
    Environment = "dev"
    Project     = "terraform-dev-cdn"
  }
}