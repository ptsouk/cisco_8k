# Description

Example with the creation of a Cisco 8000v NVA in Azure using Terraform and the Azure Verified Modules.

## AZ CLI

az login --tenant <***> --use-device-code

az account list

az account set --subscription <***>

az logout

## Find cisco images

az vm image list -o table --publisher cisco --offer cisco-c8000v-byol --all

## Terraform

terraform init

terraform plan -out main.tfplan

terraform apply main.tfplan

terraform plan -destroy -out main.destroy.tfplan

terraform apply main.destroy.tfplan

terraform apply -auto-approve

terraform destroy -auto-approve

## Get output

terraform output -json virtualMachineOutputs | ConvertFrom-Json
