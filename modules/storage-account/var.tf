# Resource Groups variables:

variable "resource_group" {
  type = string
  default = "marcorg"
}
 
variable "location" {
  type = string
  default = "westeurope"
} 


#Storage account specific variables.

variable "storage_account_name" {
  type = string
  default = "marcostorage12xyz24678"
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}

variable "access_tier" {
  type = string
  default = "Hot"
}

variable "allow_blob_public_access" {
  type = bool
  default = "false"
}