resource "aws_cognito_user_pool" "terraform-lab-cognito" {
  name = var.user_pool_name

  password_policy {
    minimum_length    = var.password_minimum_length
    require_uppercase = var.require_uppercase
    require_lowercase = var.require_lowercase
    require_numbers   = var.require_numbers
    require_symbols   = var.require_symbols
  }

  tags = var.tags
}

resource "aws_cognito_user_pool_client" "client" {
  name         = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.terraform-lab-cognito.id
  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
}

resource "aws_cognito_user_pool_domain" "my_user_pool_domain" {
  domain      = "auth-service-123"  # Your custom domain
  user_pool_id = aws_cognito_user_pool.terraform-lab-cognito.id

  # Optionally, you can specify a certificate ARN if you have it
  # certificate_arn = aws_acm_certificate.my_certificate.arn
}
