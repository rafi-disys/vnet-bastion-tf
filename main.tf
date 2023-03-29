terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rafi-rg" {
  name     = var.rg-name
  location = var.location
  tags = var.tags
}

resource "azurerm_virtual_network" "rafi-vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rafi-rg.location
  resource_group_name = azurerm_resource_group.rafi-rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "rafi-subnet" {
  for_each = var.subnet
  name = each.value[name]
  address_prefixes = each.value[address_prefixes]
  resource_group_name = var.rg-name
  virtual_network_name = azurerm_resource_group.rafi-rg.name
  
}

resource "azurerm_public_ip" "bastion_pip" {
    name = "${var.bastionhostname }-pip"
    resource_group_name = var.rg-name
    location = var.location
    allocation_method = "Static"
    sku = "Standard"
    tags = var.tags
  
}

resource "azurerm_bastion_host" "rafi-bastion" {
    name = var.bastionhostname
    resource_group_name = var.rg-name
    location = var.location
    tags = var.tags

    ip_configuration {
      name = "bastion-config"
      subnet_id = var.subnet["bastion_subnet"].id
      public_ip_address_id = azurerm_public_ip.bastion_pip.id
    }

  
}