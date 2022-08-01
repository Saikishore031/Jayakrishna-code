variable "client_id" {}
variable "client_secret" {}
variable "location" {}

variable "rg_name" {}

#variable "service_cidr" {}
#variable "service_endpoints" {}

variable "mgmt_subnet_name" {}
variable "subnet_address_prefixes" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "vnet_address_space" {}


#acr
variable "acr_name" {}
variable "acr_sku" {}
variable "admin_enabled" {} 
#variable "georeplication_locations" {}

# Dev Storage Accounts
variable "storage_account_container_access_type" {}
variable "storage_account_name" {}
variable "storage_account_replication_type" {}
variable "storage_account_tier" {}
variable "storage_container_name" {}

#aks
variable "k8_pool_type" {}
variable "k8_version" {}
variable "k8s_admin_username" {}
variable "k8s_client_id" {}
variable "k8s_client_secret" {}
variable "k8s_cluster_name" {}
variable "k8s_dns_prefix" {}
variable "dns_service_ip" {}
variable "docker_bridge_cidr" {}
variable "enable_as" {}
variable "max_count" {}
variable "min_count" {}
variable "vm_sku" {}
variable "rbac_enabled" {}
variable "agent_count" {}
variable "agent_pool_name" {}
variable "service_cidr" {}

# Virtual Machine 

variable "admin_password" {}
variable "admin_username" {}
variable "image_offer" {}
variable "image_publisher" {}
variable "image_sku" {}
variable "image_version" {}
variable "os_disk_type" {}
variable "vm_instances_count" {}
variable "vm_name" {}
variable "vm_size" {}
variable "disk_size_gb" {}

#akv
variable "akv_name" {}
variable "object_id" {}