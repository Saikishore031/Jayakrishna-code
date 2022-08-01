output "vm_ids" {
  description = "The ID of the Virtual Machine."
  value       = azurerm_virtual_machine.vm[*].id
}