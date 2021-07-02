# Configure the Azure provider
provider "azurerm" {
    version = "2.26.0"

    features {}
}

# Configure Terraform
terraform {
    required_version = "0.14.6"

    backend "azurerm" {
    }
}


