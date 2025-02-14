resource "azurerm_virtual_network" "example_vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnets" {
  count                = var.subnet_count
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  #address_prefixes     = [var.subnet_address_prefixes[count.index]]
  address_prefixes = [cidrsubnet(var.vnet_address_space, 8, count.index)]
}
resource "azurerm_network_security_group" "nsgs" {
  count               = var.subnet_count
  name                = var.nsg_name[count.index]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_associations" {
  count                     = var.subnet_count
  subnet_id                 = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.nsgs[count.index].id
}