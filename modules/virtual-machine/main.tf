# Generate random password
resource "random_password" "this" {
  length           = 32
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  number           = true
  special          = true
  override_special = "!@#$%&"
}

locals {
  admin_password = var.admin_password == null ? random_password.this.result : var.admin_password

} 

data "azurerm_resource_group" "resource_group" {
  name = "marcorg"
}

data "azurerm_subnet" "frontendsubnet" {
  name                 = "frontendsubnet"
  virtual_network_name = "marcovnet"
  resource_group_name  = "marcorg"
}

data "azurerm_subnet" "backendsubnet" {
  name                 = "backendsubnet"
  virtual_network_name = "marcovnet"
  resource_group_name  = "marcorg"
}

resource "azurerm_network_interface" "nic1" {
  name                = var.nic1
  location                     = data.azurerm_resource_group.resource_group.location
  resource_group_name          = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     =  data.azurerm_subnet.frontendsubnet.id
    private_ip_address_allocation = "dynamic"
  }
}
resource "azurerm_network_interface" "nic2" {
  name                = var.nic2
  location                     = data.azurerm_resource_group.resource_group.location
  resource_group_name          = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     =  data.azurerm_subnet.backendsubnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_virtual_machine" "virtual_machine1" {
  name                = var.virtual_machine1
  resource_group_name = var.resource_group
  location            = var.location
  vm_size             = "Standard_B2s"
  network_interface_ids = [azurerm_network_interface.nic1.id]

  storage_image_reference {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter-Server-Core-smalldisk"
  version   = "latest"
  }
  os_profile_windows_config {
  provision_vm_agent = true
  }

  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
  computer_name  = var.virtual_machine1   
  admin_username = var.admin_username
  admin_password = local.admin_password
  }
}  

resource "azurerm_virtual_machine" "virtual_machine2" {
  name                = var.virtual_machine2
  resource_group_name = var.resource_group
  location            = var.location
  vm_size             = "Standard_B2s"
  network_interface_ids = [azurerm_network_interface.nic2.id]

  storage_image_reference {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter-Server-Core-smalldisk"
  version   = "latest"
  }
  os_profile_windows_config {
  provision_vm_agent = true
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
  computer_name  = var.virtual_machine2  
  admin_username = var.admin_username
  admin_password = local.admin_password
  }
}  

output "admin_password" {
    value = local.admin_password
}

resource "azurerm_key_vault_secret" "virtual_machine_1" {
  name         = var.admin_username
  value        = local.admin_password
  key_vault_id = var.key_vault_id
}