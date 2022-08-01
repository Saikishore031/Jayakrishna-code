# Service Principal
# subscription_id = "df8ca7a5-e073-4826-930c-00ea412296a8"
# client_id       = "2adad5dc-936f-4994-9f0d-8890747f3518"
# client_secret   = "h3MLkK1UEs7234--u65r4a1O1X-OM_1b_W"
# tenant_id       = "77364ce3-9066-4d15-a8c5-5e9bd0685cd8"

# RPM Subscription 

subscription_id = ""
client_id       = ""
client_secret   = ""
tenant_id       = ""



# Location
location = "eastus"

# Network RG and VNET and subnets
rg_name                 = "azrpm-dev-rg01"
vnet_name               = "azrpm-dev-vnet01"
vnet_address_space      = "172.21.0.0/16"
subnet_address_prefixes = ["172.21.1.0/24", "172.21.2.0/24", "172.21.3.0/24"]
mgmt_subnet_name        = ["azrpm-dev-sub-aks01", "azrpm-dev-sub-aks02", "azrpm-dev-sub-aks03"]

#ACR
acr_name                                     = "azrpmdevacr"
acr_sku                                      = "Premium"
admin_enabled                                = "true"
#georeplication_locations                     = ""

# DEV Storage Account
storage_account_name                  = ""
storage_account_tier                  = "Standard"
storage_account_replication_type      = "LRS"
storage_container_name                = "boot-diagnostics1"
storage_account_container_access_type = "private"

#aks
dns_service_ip     = "10.0.0.10"
docker_bridge_cidr = "172.17.0.1/16"
service_cidr       = "10.0.0.0/16"
agent_pool_name    = "devaks"
k8s_cluster_name   = "AZRPMDEVAKS"
k8s_dns_prefix     = "azrpmdevaks"
k8s_admin_username = "adminrpm"
rbac_enabled       = "true"
k8_version         = "1.19.0"
agent_count        = "2"
vm_sku             = "Standard_B2ms"
enable_as          = "true"
min_count          = "1"
max_count          = "3"
k8_pool_type       = "VirtualMachineScaleSets"
k8s_client_id      = ""
k8s_client_secret  = ""


# Virtual Machine
vm_name            = "azrpmdevvm"
vm_size            = "Standard_B2ms"
vm_instances_count = "1"
admin_username     = "adminrpm"
admin_password     = "Adminrpm@123"
os_disk_type       = "Standard_LRS"
image_publisher    = "MicrosoftWindowsServer"
image_offer        = "WindowsServer"
image_sku          = "2016-Datacenter"
image_version      = "latest"
disk_size_gb       = "100"

#akv
  akv_name            = ""
  object_id           = """