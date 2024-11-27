resource "aws_codebuild_project" "terraform_build" {
  name          = "TerraformBuild"
  description   = "Build project to apply Terraform IaC"
  service_role  = var.codebuild_role_arn
  build_timeout = 20

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:1.0.0" # Use a Docker image with Terraform
    type                        = "LINUX_CONTAINER"
  }

  source {
    type            = "CODECOMMIT"
    location        = var.codecommit_repo_url
    buildspec       = "buildspec.yml"
  }

  logs_config {
    cloudwatch_logs {
      group_name = "/aws/codebuild/terraform-build"
      stream_name = "build-log"
    }
  }
}
