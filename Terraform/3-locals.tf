# Define local values here in Terraform

locals {
  owners = var.website_division
  environment = var.environment
  name = "$(var.website_division)-$(var.environment)"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}