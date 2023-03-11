terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
provider "azurerm" {
  features {}
}
module "vnet" {
    source = "./Module/vnet"
    name     =   var.vnet_name
    location = var.location
    address = var.address
    address_prefixes = var.address_prefixes
    resource_group_name= var.resource_group_name
}

