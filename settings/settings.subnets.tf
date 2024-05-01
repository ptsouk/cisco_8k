locals {
  primary_subnets = {
    subnet01 = "/subscriptions/${local.subscription_id_connectivity1}/resourceGroups/primary-vnet-rg/providers/Microsoft.Network/virtualNetworks/primary-vnet01/subnets/subnet01"
    subnet02 = "/subscriptions/${local.subscription_id_connectivity1}/resourceGroups/primary-vnet-rg/providers/Microsoft.Network/virtualNetworks/primary-vnet01/subnets/subnet02"
    subnet03 = "/subscriptions/${local.subscription_id_connectivity1}/resourceGroups/primary-vnet-rg/providers/Microsoft.Network/virtualNetworks/primary-vnet01/subnets/subnet03"
    subnet04 = "/subscriptions/${local.subscription_id_connectivity1}/resourceGroups/primary-vnet-rg/providers/Microsoft.Network/virtualNetworks/primary-vnet01/subnets/subnet04"
  }
  secondary_subnets = {
    subnet01 = "/subscriptions/${local.subscription_id_connectivity2}/resourceGroups/secondary-vnet-rg/providers/Microsoft.Network/virtualNetworks/secondary-vnet01/subnets/subnet01"
    subnet02 = "/subscriptions/${local.subscription_id_connectivity2}/resourceGroups/secondary-vnet-rg/providers/Microsoft.Network/virtualNetworks/secondary-vnet01/subnets/subnet02"
    subnet03 = "/subscriptions/${local.subscription_id_connectivity2}/resourceGroups/secondary-vnet-rg/providers/Microsoft.Network/virtualNetworks/secondary-vnet01/subnets/subnet03"
    subnet04 = "/subscriptions/${local.subscription_id_connectivity2}/resourceGroups/secondary-vnet-rg/providers/Microsoft.Network/virtualNetworks/secondary-vnet01/subnets/subnet04"
  }
}