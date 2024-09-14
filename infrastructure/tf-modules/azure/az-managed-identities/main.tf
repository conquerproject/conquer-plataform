provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_user_assigned_identity" "identity" {
  for_each            = var.name
  name                = each.key
  location            = var.location
  resource_group_name = var.rg
  tags                = var.tags
}
