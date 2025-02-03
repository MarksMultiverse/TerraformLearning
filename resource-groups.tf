# PROVIDERS

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "network" {
  name     = var.rg_name[0]
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "infra" {
  name     = var.rg_name[1]
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "vms" {
  name     = var.rg_name[2]
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "image" {
  name     = var.rg_name[3]
  location = var.location
  tags     = local.common_tags
}