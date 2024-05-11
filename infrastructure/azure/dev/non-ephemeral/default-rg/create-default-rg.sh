#!/bin/bash

set -o nounset                              # Treat unset variables as an error

constants_file="$(git rev-parse --show-toplevel)/infrastructure/azure/dev/constants.yaml"

get_value_from_constants() {
    local key="$1"
    grep "^$key" "$constants_file" | awk '{print $2}'
}

subscription_id="$(get_value_from_constants subscription_id)"
region="$(get_value_from_constants region)"
default_rg="$(get_value_from_constants default_rg)"


# Select dev subscription
az account set --subscription "$subscription_id"

# Create the default Resource Group
if [[ "$(az group list --output json | jq -r --arg rg "$default_rg" '.[] | select(.name == $rg) | .name')" != "$default_rg" ]]; then
   echo "Creating default RG..."
    az group create --name "$default_rg" --location "$region"
    az group wait --create --name "$default_rg"
    echo "Resource Group $default_rg created"
else
    echo "RG $default_rg already in place"
fi
