terraform {
  source = "${get_repo_root()}//infrastructure/tf-modules/azure/az-managed-identities"
}

include "tg_shared_configs" {
  path = find_in_parent_folders("tg-shared-configs.hcl")
}

locals {
  global-constants = yamldecode(
    file("${get_repo_root()}//infrastructure/global-constants.yaml")
  )
  environment-constants = yamldecode(
    file("${get_repo_root()}/infrastructure/azure/dev/constants.yaml")
  )
}

inputs = {
  subscription_id = local.environment-constants.subscription_id
  rg              = local.environment-constants.default_rg
  location        = local.environment-constants.region

  name = [
    "cert-manager",
    "external-dns",
  ]

  tags = merge(
    local.global-constants.global-tags,
    local.environment-constants.tags
  )
}
