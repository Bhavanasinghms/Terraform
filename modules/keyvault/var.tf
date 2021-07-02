# Resource Groups variables:

variable "resource_group" {
  type = string
  default = "marcorg"
}
 
variable "location" {
  type = string
  default = "westeurope"
} 

#keyvault specific variables

variable "keyvault_name" {
  type = string
  default = "marcokv"
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
}







