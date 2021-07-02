# Resource Groups variables:

variable "resource_group" {
  type = string
  default = "marcorg"
}
 
variable "location" {
  type = string
  default = "westeurope"
} 

# Virtual machine specific variables

variable "virtual_machine1" {
  type = string
  default = "marcovm1"
}
variable "virtual_machine2" {
  type = string
  default = "marcovm2"
}

variable "public_ip1" {
  type = string
  default = "publicIP1"
}

variable "public_ip2" {
  type = string
  default = "publicIP2"
}

variable "subnet1" {
  type = string
  default = "frontendsubnet"
}

variable "subnet2" {
  type = string
  default = "backendsubnet"
}

variable "admin_username"{
  type = string
  default = "adminmarco"
}

variable "admin_password"{
  type = string
  default = null
}

variable "key_vault_id"{
  description = "Keyvault ID"
  type = string
}

variable "nic1"{
  type = string
  default = "nic1"
}

variable "nic2"{
  type = string
  default = "nic2"

}
