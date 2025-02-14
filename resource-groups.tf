resource "azurerm_resource_group" "network" {
  name     = "${local.naming_prefix}-${var.rg_name[0]}"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "infra" {
  name     = "${local.naming_prefix}-${var.rg_name[1]}"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "vms" {
  name     = "${local.naming_prefix}-${var.rg_name[2]}"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "image" {
  name     = "${local.naming_prefix}-${var.rg_name[3]}"
  location = var.location
  tags     = local.common_tags
}