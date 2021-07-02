resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = ["192.168.0.0/23"]

  subnet {
    name           = var.subnet1
    address_prefix = "192.168.1.0/24"
  }

  subnet {
    name           = var.subnet2
    address_prefix = "192.168.0.0/24"
  }
}

resource "azurerm_network_security_group" "subnet1_nsg" {
  name                = var.subnet1_nsg
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_security_rule" "subnet1_nsg" {
  name                        = "Open Port 80"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.subnet1_nsg.name
}

resource "azurerm_network_security_rule" "subnet1_nsg" {
  name                        = "Open Port 443"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.subnet1_nsg.name
}