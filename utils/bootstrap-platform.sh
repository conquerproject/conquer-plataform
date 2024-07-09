#!/bin/bash

set -e

AZ_SUBSCRIPTION="conquerproject"
RESOURCE_GROUP="rg-conquerplatform-dev-01"
AKS_NAME="aks-conquerproject-dev-01"
TERRAGRUNT_CONFIG="$(git rev-parse --show-toplevel)/infrastructure/azure/dev/ephemeral/aks/terragrunt.hcl"
BOOTSTRAP_ARGOCD="$(git rev-parse --show-toplevel)/argocd/argocd-bootstrap/argocd-bootstrap.sh"

# Set Azure Subscription
az account set --subscription "$AZ_SUBSCRIPTION"

usage() {
    echo "Usage: $0 [--apply] [--destroy]"
    exit 1
}

bootstrap_platform() {
    printf "Provisioning AKS and setting context on kubeconfig file...\n\n"
    terragrunt --terragrunt-config "$TERRAGRUNT_CONFIG" apply --auto-approve
    az aks get-credentials --resource-group "$RESOURCE_GROUP" --name "$AKS_NAME" --overwrite-existing --admin

    printf "Deploying ArgoCD...\n\n"
    bash "$BOOTSTRAP_ARGOCD"

    # Add azure credentials for external-dns
    # TODO: create sealed-secret
    k apply -f "$(git rev-parse --show-toplevel)/argocd/defaults/external-dns/manifests/secrets/"
}

destroy_platform() {
    printf "Destroying AKS...\n\n"
    terragrunt --terragrunt-config "$TERRAGRUNT_CONFIG" destroy --auto-approve
}

main() {
    case "$1" in
        --apply) bootstrap_platform; shift;;
        --destroy) destroy_platform; shift;;
        *) usage;;
    esac
}

main "$1"
