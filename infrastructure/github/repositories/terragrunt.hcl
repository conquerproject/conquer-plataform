include "tg-shared-configs" {
  path = find_in_parent_folders("tg-shared-configs.hcl")
}

terraform {
  source = "git@github.com:conquerproject/tf-modules//github-repositories?ref=gh-repos-v0.1.0"

}

inputs = yamldecode(file("repos.yaml"))

