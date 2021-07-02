# Resource Groups variables:

variable "resource_group" {
  type = string
  default = "marcorg"
}
 
variable "location" {
  type = string
  default = "westeurope"
} 

# Virtual network specific variables

variable "virtual_network_name" {
  type = string
  default = "marcovnet"
}

variable "subnet1" {
  type = string
  default = "frontendsubnet"
}

variable "subnet2" {
  type = string
  default = "backendsubnet"
}

variable "subnet1_nsg" {
  type = string
  default = "macroNSG"
}

