resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "terraform-lab-codepipeline-bucket"
  acl    = "private"
}
