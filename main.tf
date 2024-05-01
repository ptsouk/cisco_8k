provider "azurerm" {
  features {}
}

# import settings
module "settings" {
  source = "./settings"
}

module "regions" {
  source  = "Azure/regions/azurerm"
  version = ">= 0.6.0"
}

data "azurerm_key_vault" "avmkeyvault" {
  provider            = azurerm.subscription_id_management
  name                = "tf-avm-secrets"
  resource_group_name = "tfstate-rg"
}

data "azurerm_key_vault_secret" "localadminPassword" {
  provider     = azurerm.subscription_id_management
  name         = "avm-localadminPassword"
  key_vault_id = data.azurerm_key_vault.avmkeyvault.id
}

resource "azurerm_marketplace_agreement" "primary" {
  provider = azurerm.subscription_id_connectivity1
  count    = (var.enable_plan && var.accept_marketplace_agreement) == true ? 1 : 0

  publisher = var.source_image_reference.publisher
  offer     = var.source_image_reference.offer
  plan      = var.source_image_reference.sku
}

resource "azurerm_marketplace_agreement" "secondary" {
  provider = azurerm.subscription_id_connectivity2
  count    = (var.enable_plan && var.accept_marketplace_agreement) == true ? 1 : 0

  publisher = var.source_image_reference.publisher
  offer     = var.source_image_reference.offer
  plan      = var.source_image_reference.sku
}

module "cisco8k_primary" {
  providers = {
    azurerm = azurerm.subscription_id_connectivity1
  }
  depends_on = [
    azurerm_marketplace_agreement.primary
  ]
  source                             = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                            = "0.12.0"
  count                              = length(module.settings.cisco8k.virtualMachines_primary_location)
  enable_telemetry                   = var.enable_telemetry
  location                           = module.settings.default.primary_location
  resource_group_name                = module.settings.default.resource_group_name1
  virtualmachine_os_type             = var.virtualmachine_os_type
  name                               = module.settings.cisco8k.virtualMachines_primary_location[count.index]["name"]
  generate_admin_password_or_ssh_key = false
  disable_password_authentication    = false
  admin_username                     = "localadmin"
  admin_password                     = data.azurerm_key_vault_secret.localadminPassword.value
  virtualmachine_sku_size            = module.settings.cisco8k.virtualMachines_primary_location[count.index]["virtualmachine_sku_size"]
  zone                               = element(module.regions.regions_by_name[module.settings.default.primary_location].zones, count.index)
  boot_diagnostics                   = var.boot_diagnostics
  source_image_reference             = var.source_image_reference
  network_interfaces                 = module.settings.cisco8k.virtualMachines_primary_location[count.index]["network_interfaces"]
  plan = {
    publisher = var.source_image_reference.publisher
    product   = var.source_image_reference.offer
    name      = var.source_image_reference.sku
  }
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 16
  }
}

module "cisco8k_secondary" {
  providers = {
    azurerm = azurerm.subscription_id_connectivity2
  }
  depends_on = [
    azurerm_marketplace_agreement.secondary
  ]
  source                             = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                            = "0.12.0"
  count                              = length(module.settings.cisco8k.virtualMachines_secondary_location)
  enable_telemetry                   = var.enable_telemetry
  location                           = module.settings.default.secondary_location
  resource_group_name                = module.settings.default.resource_group_name2
  virtualmachine_os_type             = var.virtualmachine_os_type
  name                               = module.settings.cisco8k.virtualMachines_secondary_location[count.index]["name"]
  generate_admin_password_or_ssh_key = false
  disable_password_authentication    = false
  admin_username                     = "localadmin"
  admin_password                     = data.azurerm_key_vault_secret.localadminPassword.value
  virtualmachine_sku_size            = module.settings.cisco8k.virtualMachines_secondary_location[count.index]["virtualmachine_sku_size"]
  zone                               = element(module.regions.regions_by_name[module.settings.default.secondary_location].zones, count.index)
  boot_diagnostics                   = var.boot_diagnostics
  source_image_reference             = var.source_image_reference
  network_interfaces                 = module.settings.cisco8k.virtualMachines_secondary_location[count.index]["network_interfaces"]
  plan = {
    publisher = var.source_image_reference.publisher
    product   = var.source_image_reference.offer
    name      = var.source_image_reference.sku
  }
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 16
  }
}
