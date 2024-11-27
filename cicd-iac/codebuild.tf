module "codebuild" {
  source                 = "../modules/application/codebuild"
  codebuild_role_arn    = module.role-cicd.codebuild_role_arn
  codecommit_repo_url   = module.codecommit.repository_clone_url_http
  aws_region            = var.region
}

