variable "k8s_cluster_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "k8s_dns_prefix" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "k8_version" {
  default = ""
}

variable "k8s_admin_username" {
  default = ""
}

variable "public_ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "agent_pool_name" {
  default = ""
}

variable "agent_count" {
  default = "3"
}

variable "vm_sku" {
  default = ""
}

variable "os_type" {
  default = "Linux"
}

variable "aks_subnet_id" {
  default = ""
}

variable "k8s_client_id" {
  default = ""
}

variable "k8s_client_secret" {
  default = ""
}

variable "rbac_enabled" {
  default = ""
}

variable "dns_service_ip" {
  default = ""
}

variable "docker_bridge_cidr" {
  default = ""
}

variable "service_cidr" {
  default = ""
}

variable "enable_as" {
  default = ""
}
variable "min_count" {
  default = ""
}
variable "max_count" {
  default = ""
}
variable "k8_pool_type" {
  default = ""
}
