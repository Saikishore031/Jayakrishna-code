# Generate random text for a unique storage account name
resource "azurerm_storage_account" "sa" {
  name                              = var.storage_account_name
  resource_group_name               = var.rg_name
  location                          = var.location
  account_tier                      = var.storage_account_tier
  account_replication_type          = var.storage_account_replication_type
  enable_advanced_threat_protection = var.enable_advanced_threat_protection
}

resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  resource_group_name   = var.rg_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.storage_account_container_access_type
}