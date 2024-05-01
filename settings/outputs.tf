output "default" {
  description = "Configuration settings for the deployment"
  value = {
    subscription_id_management    = local.subscription_id_management
    primary_location              = local.primary_location
    secondary_location            = local.secondary_location
    subscription_id_connectivity1 = local.subscription_id_connectivity1
    resource_group_name1          = local.resource_group_name1
    subscription_id_connectivity2 = local.subscription_id_connectivity2
    resource_group_name2          = local.resource_group_name2
  }
}

output "cisco8k" {
  description = "Configuration settings for cisco8k deployment"
  value = {
    virtualMachines_primary_location   = local.virtualMachines_primary_location
    virtualMachines_secondary_location = local.virtualMachines_secondary_location
  }
}

output "subnets" {
  description = "Configuration settings for subnets"
  value = {
    primary_subnets   = local.primary_subnets
    secondary_subnets = local.secondary_subnets
  }
}
