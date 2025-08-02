variable "region" {
  description = "AWS region"
  type        = string
}

variable "my_domain" {
  description = "Hosted zone name"
  type        = string
  default     = "styrinov.com.ua"
}

variable "lord_of_terraform" {
  description = "Owner of this project"
  type        = string
  default     = "Serhii Tyrinov"
}

variable "key_name" {
  description = "The key name of private key"
  type        = string
}
