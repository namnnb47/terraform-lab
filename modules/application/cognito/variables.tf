variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "password_minimum_length" {
  description = "Minimum length for user passwords"
  type        = number
  default     = 8
}

variable "require_uppercase" {
  description = "Require uppercase letters in passwords"
  type        = bool
  default     = true
}

variable "require_lowercase" {
  description = "Require lowercase letters in passwords"
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Require numbers in passwords"
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Require symbols in passwords"
  type        = bool
  default     = true
}

variable "user_pool_client_name" {
  description = "Name of the Cognito User Pool Client"
  type        = string
}

variable "tags" {
  description = "Tags for the Cognito resources"
  type        = map(string)
  default     = {}
}
