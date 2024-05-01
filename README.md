# Description

Example with the creation of a Cisco 8000v NVA in Azure using Terraform and the Azure Verified Modules.

Conceptual diagram:

<div align="center">
  <img src="https://github.com/ptsouk/cisco_8k/blob/df68a7582bb9a3b8b035ecfbe8d7733e27d58d9c/Brainboard%20-%20Cisco8k.png?raw=true"
  width="600" height="300"/>
</div>

## AZ CLI

```bash
az login --tenant <***> --use-device-code

az account list

az account set --subscription <***>

az logout
```

## Find cisco images

```bash
az vm image list -o table --publisher cisco --offer cisco-c8000v-byol --all
```

## Terraform

```bash
terraform init

terraform plan -out main.tfplan

terraform apply main.tfplan

terraform plan -destroy -out main.destroy.tfplan

terraform apply main.destroy.tfplan

terraform apply -auto-approve

terraform destroy -auto-approve
```

## Get output

```bash
terraform output -json virtualMachineOutputs | ConvertFrom-Json
```
