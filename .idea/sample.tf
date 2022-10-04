terraform {
  required_verion = ">= 1.0.0"
  reuired_providers = {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "storagerg"
    storage_account_name = "storagename"
    container_name = "storagecontainer"
    key = "terraform.tf"
  }
}

provider "azurerm" {
  features {
    
  }
}
resource "azurerm_resource_group" "rg" {
    name = "rg1"
    location = "eastus1"
}

resource "azurerm_virtual_network" "vnet" {
    name = "rg1"
    location = azurerm_resource_group.location
    address_space = [ "10.25.35.25" ]
    resource_group_name = azurerm_resource_group.rg
}
