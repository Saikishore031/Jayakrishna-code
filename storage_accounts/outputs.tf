output "id" {
  value = azurerm_storage_account.sa.id
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}