locals {
  os_win          = var.image_offer == "WindowsServer" ? true : false
  os_cis          = var.image_publisher == "center-for-internet-security-inc" ? true : false
  dynamic_linux   = ! local.os_win ? { dummy_create = true } : {}
  dynamic_windows = local.os_win ? { dummy_create = true } : {}
  dynamic_plan    = local.os_cis ? { dummy_create = true } : {}
}

resource "azurerm_virtual_machine" "vm" {
  count                        = var.vm_instances_count
  name                         = "${var.vm_name}${format(var.count_format, var.count_offset + count.index + 1)}"
  location                     = var.location
  availability_set_id          = var.avset_id
  primary_network_interface_id = var.multi_nic == "true" ? var.primary_nic_id : null
  resource_group_name          = var.resource_group_name
  network_interface_ids        = [element(var.vmnic, count.index)]
  #network_interface_ids        = var.multi_nic == "true" ? [var.nic[0], var.nic[1], var.nic[2], var.nic[3]] : [element(var.nic, count.index)]
  vm_size                      = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "${var.vm_name}${format(var.count_format, var.count_offset + count.index + 1)}-OSDISK"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_type
  }

  os_profile {
    computer_name  = "${var.vm_name}${format(var.count_format, var.count_offset + count.index + 1)}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  dynamic "os_profile_linux_config" {
    for_each = local.dynamic_linux

    content {
      disable_password_authentication = false
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = local.dynamic_windows

    content {
      enable_automatic_upgrades = true
      provision_vm_agent        = true
    }
  }

  dynamic "plan" {
    for_each = local.dynamic_plan

    content {
      name      = "var.vm_plan_name"
      product   = "var.vm_plan_product"
      publisher = "var.vm_plan_publisher"
    }
  }

  boot_diagnostics {
    enabled     = var.boot_diagnostics_enabled
    storage_uri = var.storage_uri
  }
}

resource "azurerm_managed_disk" "managed_disk" {
  count                = var.data_disk_enable == "true" ? var.vm_instances_count : 0
  name                 = "${var.vm_name}${format(var.count_format, var.count_offset + count.index + 1)}-DATADISK"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_attachment" {
  count              = var.data_disk_enable == "true" ? var.vm_instances_count : 0
  managed_disk_id    = element(azurerm_managed_disk.managed_disk.*.id, count.index)
  virtual_machine_id = element(azurerm_virtual_machine.vm.*.id, count.index)
  lun                = "${10 + count.index}"
  caching            = "ReadOnly"
}
