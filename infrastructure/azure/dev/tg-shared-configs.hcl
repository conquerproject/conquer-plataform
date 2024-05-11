generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
      backend "azurerm" {
        resource_group_name = "rg-conquerplatform-dev-01"
        storage_account_name = "stgconquerplatformdev01"
        container_name  = "tfstate"
        key = "${path_relative_to_include()}/terraform.tfstate"
      }
    }
  EOF
}
