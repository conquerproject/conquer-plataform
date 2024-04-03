terraform {
  source = "git::https://github.com/conquerproject/tf-modules.git//aks?ref=aks-v0.1.0" # Need to have the PR https://github.com/conquerproject/tf-modules/pull/7 merged and create the tag.
}

include "tg-shared-configs" {
  path = find_in_parent_folders("tg-shared-configs.hcl")
}

locals {
  global-constants      = yamldecode(file("../../../global-constants.yaml"))
  environment-constants = yamldecode(file("../az-dev-constants.yaml"))
}

inputs = {
  resource_group_name = local.environment-constants.default_dev_rg # Need the PR https://github.com/conquerproject/conquer-platform/pull/19 merged
  aks_name            = "aks-${local.global-constants.global-tags.project}-${local.environment-constants.environment}-${local.environment-constants.region}-01"
  location            = local.environment-constants.region
  node_pool_vm_size   = "Standard_B2s"
  tags                = local.environment-constants.tags
}
