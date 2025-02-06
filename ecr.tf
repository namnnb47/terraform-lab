# module "ecr" {
#   source          = "./modules/application/ecr"
#   repository_name = "terraform-dev-repo-cdn"
#   tags            = {
#     Environment   = "dev"
#     Project       = "terraform-dev-cdn"
#   }
# }