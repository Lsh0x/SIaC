generate "provider" {
  path      = "./modules/stalwart_mail/provider.tf"
  if_exists = "overwrite" # Allow modules to override provider settings
  contents  = <<EOF
provider "scaleway" {
  alias   = "example"
  profile = "example.com"

}
EOF
}

generate "versions" {
  path      = "./modules/stalwart_mail/versions.tf"
  if_exists = "overwrite" # Allow modules to override provider settings
  contents  = <<EOF
  terraform {
    required_version = ">= 1.0.0"
    required_providers {
      scaleway = {
        source  = "scaleway/scaleway"
        version = ">=2.0.0"
      }
    }
  }
  EOF
}


locals {
  user_name = "example.com"
  region    = "fr-par"
  zone      = "fr-par-1"
  env       = "prod"
  admin_email = "admin@example.com"
  mail_domain = "mail.example.com"
}

# Input variables that will be passed to the Terraform module
inputs = {
  user_name    = local.user_name
  region       = local.region
  zone         = local.zone
  env          = local.env
  admin_email  = local.admin_email
  mail_domain  = local.mail_domain
}