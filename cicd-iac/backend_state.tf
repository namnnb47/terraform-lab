

# Call the backend_state module (without the backend block)
module "backend_state" {
  source             = "../modules/application/backend_state"
  s3_state_bucket     = "terraform-lab-state-bucket"
  dynamodb_table_name = "terraform-lock-table"
}

