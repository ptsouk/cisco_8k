provider "azurerm" {
  features {}
  alias = "subscription_id_management"
  subscription_id = module.settings.default.subscription_id_management
}
provider "azurerm" {
  features {}
  alias = "subscription_id_connectivity1"
  subscription_id = module.settings.default.subscription_id_connectivity1
}
provider "azurerm" {
  features {}
  alias = "subscription_id_connectivity2"
  subscription_id = module.settings.default.subscription_id_connectivity2
}