terraform {
  required_verion = ">= 1.0.0"
  required_providers = {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "storagerg"
    storage_account_name = "storagename"
    container_name = "tfstatefile"
    key = "terraform.files"    
  }
}
provider "azurerm" {
    features {}  
}

resource "azurerm_resource_group" "myrg" {
  name = "myrg"
  location = "eastus1"
}

resource "azurerm_virtual_network" "vnet" {
  name = vnet1
  location = azurerm_resource_group.myrg
  address_space = [ "10.25.45.54" ]
  resource_group_name = azurerm_resource_group.myrg
}
