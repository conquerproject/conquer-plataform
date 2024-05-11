terraform {
  source = "${get_repo_root()}//infrastructure/tf-modules/azure/vnet"
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
  vnet_name           = local.environment-constants.default_vnet
  resource_group_name = local.environment-constants.default_rg
  location            = local.environment-constants.region
  vnet_address_space  = ["10.0.0.0/16"]

  subnets = {
    snet-default = {
      name           = "default"
      address_prefix = ["10.0.1.0/24"]
    }
    snet-vms = {
      name           = "snet-vms-${local.environment-constants.environment}-01"
      address_prefix = ["10.0.2.0/24"]
    }
  }
  tags = merge(
    local.global-constants.global-tags,
    local.environment-constants.tags
  )
}
