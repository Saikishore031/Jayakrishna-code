resource "azurerm_subnet" "subnet" {
  count                     = length(var.subnet_address_space)
  name                      = element(var.subnet_name, count.index)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefix            = element(var.subnet_address_space, count.index)
}