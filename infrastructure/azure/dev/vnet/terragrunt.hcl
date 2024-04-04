locals {
  global-constants      = yamldecode(file("../../../global-constants.yaml"))
  environment-constants = yamldecode(file("../az-dev-constants.yaml"))
}

inputs = {
  vnet_name           = local.environment-constants.default_dev_vnet
  resource_group_name = local.environment-constants.default_dev_rg
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
  tags = {
    environment = local.environment-constants.tags.environment
    project     = local.global-constants.global-tags.project
    team        = local.global-constants.global-tags.team
    team-email  = local.global-constants.global-tags.team-email
  }
}


terraform {
  source = "git::https://github.com/conquerproject/tf-modules.git//azure-vnet?ref=az-vnet-v0.1.0"
}

include "tg_shared_configs" {
  path = find_in_parent_folders("tg-shared-configs.hcl")
}
