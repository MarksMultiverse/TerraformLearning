
# PROVIDERS

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "network" {
  name     = var.network_rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "example_vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet_names[0]
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = [var.subnet_address_prefixes[0]]
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet_names[1]
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = [var.subnet_address_prefixes[1]]
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.common_tags
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_association1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_association2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}