# # Module for CodeCommit
module "codecommit" {
  source                 = "../modules/application/codecommit"
  repository_name        = "terraform-repo"                    # Tên của repository
  repository_description = "Terraform code repository"         # Mô tả repository
}