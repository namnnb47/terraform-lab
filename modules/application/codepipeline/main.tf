resource "aws_codepipeline" "terraform_pipeline" {
  name = "IaC-Pipeline"

  role_arn = var.codepipeline_role_arn

  artifact_store {
    type     = "S3"
    location = var.artifact_bucket  # Ensure this variable contains the bucket name
  }

  stage {
    name = "Source"
    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]  # Correct list format
      configuration = {
        RepositoryName = "terraform-repo"  # Make sure this repo exists
        BranchName     = "main"            # Specify the correct branch
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "BuildAction"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"  # Ensure version is set
      input_artifacts  = ["source_output"]   # Input artifact from the Source stage
      output_artifacts = ["build_output"]    # Build output
      configuration = {
        ProjectName = var.codebuild_project_name  # Ensure the CodeBuild project exists
      }
    }
  }

  # Add additional stages if necessary (e.g., Deploy stage)
}
