#toggle telemetry on or off
variable "enable_telemetry" {
  type    = bool
  default = false
}

variable "boot_diagnostics" {
  type        = bool
  default     = true
  description = "(Optional) Enable or Disable boot diagnostics."
  nullable    = false
}

variable "virtualmachine_os_type" {
  type    = string
  default = "Linux"
}

variable "enable_plan" {
  description = "Enable usage of the Offer/Plan on Azure Marketplace. Even plan sku \"byol\", which means \"bring your own license\", still requires accepting on the Marketplace. Can be set to `false` when using a custom image."
  default     = true
  type        = bool
}

variable "accept_marketplace_agreement" {
  description = <<-EOT
  Allows accepting the Legal Terms for a Marketplace Image, when using bring your own license.
  You don't need set to `true` when you have already accepted the legal terms on your current subscription.
  Check available in market place: az vm image list -o table --publisher cisco --offer cisco-Virtual Appliance --all
  https://azuremarketplace.microsoft.com/en-us/home
  EOT
  default     = true
  type        = bool
}

variable "source_image_reference" {
  default = {
    offer     = "cisco-c8000v-byol"
    publisher = "cisco"
    sku       = "17_09_04a-byol"
    version   = "latest"
  }
}