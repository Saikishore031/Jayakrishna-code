resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.k8s_cluster_name
  location            = var.location
  dns_prefix          = var.k8s_dns_prefix
  resource_group_name = var.resource_group_name
  kubernetes_version  = var.k8_version

  linux_profile {
    admin_username = var.k8s_admin_username

      ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }

  agent_pool_profile {
    name                = var.agent_pool_name
    count               = var.agent_count
    vm_size             = var.vm_sku
    os_type             = var.os_type
    os_disk_size_gb     = 30
    enable_auto_scaling = var.enable_as
    min_count           = var.min_count
    max_count           = var.max_count
    type                = var.k8_pool_type

    # Required for advanced networking
    vnet_subnet_id = var.aks_subnet_id
  }

  service_principal {
    client_id     = var.k8s_client_id
    client_secret = var.k8s_client_secret
  }

  role_based_access_control {
    enabled = var.rbac_enabled
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
  }
}
