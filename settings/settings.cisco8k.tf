locals {
  virtualMachines_primary_location = [
    {
      name                    = "cisco8k-primary-001"
      virtualmachine_sku_size = "Standard_D16ds_v5"
      network_interfaces = {
        network_interface_1 = {
          name                           = "cisco8k-primary-001-nic001"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet01"]              
              create_public_ip_address      = false
            }
          }
        }
        network_interface_2 = {
          name                           = "cisco8k-primary-001-nic002"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet02"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_3 = {
          name                           = "cisco8k-primary-001-nic003"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet03"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_4 = {
          name                           = "cisco8k-primary-001-nic004"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet04"]
              create_public_ip_address      = false
            }
          }
        }
      }
    },
    {
      name                    = "cisco8k-primary-002"
      virtualmachine_sku_size = "Standard_D16ds_v5"
      network_interfaces = {
        network_interface_1 = {
          name                           = "cisco8k-primary-002-nic001"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet01"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_2 = {
          name                           = "cisco8k-primary-002-nic002"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet02"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_3 = {
          name                           = "cisco8k-primary-002-nic003"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet03"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_4 = {
          name                           = "cisco8k-primary-002-nic004"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.primary_subnets["subnet04"]
              create_public_ip_address      = false
            }
          }
        }
      }
    }
  ]
  virtualMachines_secondary_location = [
    {
      name                    = "cisco8k-secondary-001"
      virtualmachine_sku_size = "Standard_D16ds_v5"
      network_interfaces = {
        network_interface_1 = {
          name                           = "cisco8k-secondary-001-nic001"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet01"]              
              create_public_ip_address      = false
            }
          }
        }
        network_interface_2 = {
          name                           = "cisco8k-secondary-001-nic002"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet02"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_3 = {
          name                           = "cisco8k-secondary-001-nic003"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet03"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_4 = {
          name                           = "cisco8k-secondary-001-nic004"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet04"]
              create_public_ip_address      = false
            }
          }
        }
      }
    },
    {
      name                    = "cisco8k-secondary-002"
      virtualmachine_sku_size = "Standard_D16ds_v5"
      network_interfaces = {
        network_interface_1 = {
          name                           = "cisco8k-secondary-002-nic001"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet01"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_2 = {
          name                           = "cisco8k-secondary-002-nic002"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet02"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_3 = {
          name                           = "cisco8k-secondary-002-nic003"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet03"]
              create_public_ip_address      = false
            }
          }
        }
        network_interface_4 = {
          name                           = "cisco8k-secondary-002-nic004"
          accelerated_networking_enabled = true
          ip_configurations = {
            ip_configuration_1 = {
              name                          = "ipconfig1"
              private_ip_subnet_resource_id = local.secondary_subnets["subnet04"]
              create_public_ip_address      = false
            }
          }
        }
      }
    }
  ]
}
