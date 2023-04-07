terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

module "virtualmachine" {
  source                             = "./Modules/virtualmachine"
  configuration_virtualmachine_multi = var.configuration_virtualmachine

}
