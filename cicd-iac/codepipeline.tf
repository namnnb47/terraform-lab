module "codepipeline" {
  source                  = "../modules/application/codepipeline"
  codepipeline_role_arn   = module.role-cicd.codepipeline_role_arn
  artifact_bucket         = module.s3-cicd.artifact_bucket
  repository_name         = module.codecommit.repository_name
  branch_name             = "main"
  codebuild_project_name  = module.codebuild.codebuild_project_name
}
