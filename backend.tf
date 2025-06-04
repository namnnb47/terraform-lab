terraform {
  backend "s3" {
    bucket         = "terraform-lab-backend-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lab-locks"
  }
}
