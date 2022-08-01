# Resource Groups
module "resource_group" {
  source      = "../resource_group"
  rg_name     = var.rg_name
  location    = var.location
}

module "virtual_network" {
  source              = "../virtual_network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  vnet_address_space  = var.vnet_address_space
}

module "mgmt_subnet" {
  source                = "../subnet"
  subnet_name           = var.mgmt_subnet_name
  resource_group_name   =  module.resource_group.name
  vnet_name             = module.virtual_network.name
  subnet_address_space  = var.subnet_address_prefixes
}

module "azurerm_network_interface" {
  source              = "../nic"
  location            = var.location
  rg_name             =  module.resource_group.name
  subnet_id           = module.mgmt_subnet.subnet_id[0]

}


module "azurerm_container_registry" {
  source                  = "../acr"
  acr_name = var.acr_name
  # resource_group_name = module.resource_group.name
  resource_group_name     =  module.resource_group.name
  location                = var.location
  acr_sku                 = var.acr_sku
  admin_enabled           = var.admin_enabled
}

module "azurerm_storage_accounts" {
  source                                = "../storage_accounts"
  storage_account_name                  = var.storage_account_name
  # resource_group_name                   = module.resource_group.name
  rg_name                               = module.resource_group.name
  location                              = var.location
  storage_account_tier                  = var.storage_account_tier
  storage_account_replication_type      = var.storage_account_replication_type
  storage_container_name                = var.storage_container_name
  storage_account_container_access_type = var.storage_account_container_access_type
}

module "aks" {
  source              = "../aks"
  dns_service_ip      = var.dns_service_ip
  docker_bridge_cidr  = var.docker_bridge_cidr
  #resource_group_name = module.resource_group.name
  #resource_group_name  = data.azurerm_resource_group.dev_rg.name
  resource_group_name =  module.resource_group.name
  location            = var.location
  service_cidr        = var.service_cidr
  k8s_admin_username  = var.k8s_admin_username
  agent_pool_name     = var.agent_pool_name
  k8s_cluster_name    = var.k8s_cluster_name
  k8s_dns_prefix      = var.k8s_dns_prefix
  aks_subnet_id       = module.mgmt_subnet.subnet_id[0]
  rbac_enabled        = var.rbac_enabled
  vm_sku              = var.vm_sku
  k8_version          = var.k8_version
  agent_count         = var.agent_count
  k8s_client_id       = var.k8s_client_id
  k8s_client_secret   = var.k8s_client_secret
  enable_as           = var.enable_as
  min_count           = var.min_count
  max_count           = var.max_count
  k8_pool_type        = var.k8_pool_type
}

# # Virtual Machine 

# module "vm" {
#   source              = "../vm"
#   vm_name             = var.vm_name
#   location            = var.location
#   resource_group_name =  module.resource_group.name
#   vm_instances_count  = var.vm_instances_count
#   vm_size             = var.vm_size
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password
#   vmnic               = [module.azurerm_network_interface.id][0]
#   disk_size_gb        = var.disk_size_gb
#   os_disk_type        = var.os_disk_type
#   image_publisher     = var.image_publisher
#   image_offer         = var.image_offer
#   image_sku           = var.image_sku
#   image_version       = var.image_version
#   data_disk_enable    = "true"
#   multi_nic           = "false"
#   storage_uri         = module.azurerm_storage_accounts.primary_blob_endpoint
#   # azurerm_network_interface = module.azurerm_network_interface.id
# }

#akv

module "akv" {
  source = "../akv"
  akv_name             = var.akv_name
  location            = var.location
  resource_group_name =  module.resource_group.name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}