locals {
  global-constants      = yamldecode(file("../../../global-constants.yaml"))
  environment-constants = yamldecode(file("../az-dev-constants.yaml"))
}

inputs = {
  location            = local.environment-constants.region
  resource_group_name = local.environment-constants.default_dev_rg
  tags = {
    environment = local.environment-constants.tags.environment
    project     = local.global-constants.global-tags.project
    team        = local.global-constants.global-tags.team
    team-email  = local.global-constants.global-tags.team-email
  }
}


terraform {
  source = "git::https://github.com/conquerproject/tf-mofules.git/azure-resource-group?ref=az-rg-v0.1.0"
}

include "tg_shared_configs" {
  path = find_in_parent_folders("tg-shared-configs.hcl")
}
