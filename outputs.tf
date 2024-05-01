output "cisco8k_primary_output" {
  value       = { for vm in module.cisco8k_primary : vm.name => vm }
  description = "The outputs of each virtual machine."
  sensitive   = true
}

output "cisco8k_secondary_output" {
  value       = { for vm in module.cisco8k_secondary : vm.name => vm }
  description = "The outputs of each virtual machine."
  sensitive   = true
}