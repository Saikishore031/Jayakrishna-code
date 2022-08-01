
resource "azurerm_network_interface" "nic" {
  count               = 1
  name                = "azrpmwinjmphost-nic-${format(var.count_format, var.count_offset + count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "winjmphost-nic-internal-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}