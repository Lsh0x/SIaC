include "root" {
    path = find_in_parent_folders("root.hcl") 
}

# Include Terraform configurations
terraform {
  source = "../../../terraform"

}

locals {
  env = "prod"
}
# Input variables that will be passed to the Terraform module
inputs = {
  env                       = local.env
}