variable "subnet_name" {
  default     = ""
  description = "Name of the virtual network subnet"
}

variable "mgmt_subnet_name" {
  default     = ""
  description = "Name of the virtual network subnet"
}

variable "subnet_address_space" {
  default     = [" "]
  description = "List of CIDRs for the subnets."
}

variable "resource_group_name" {
  default     = ""
  description = "Resource group name"
}

variable "vnet_name" {
  default     = ""
  description = "Virtual network name"
}

variable "route_table_id" {
  default = ""
}

variable "network_security_group_id" {
  default = ""
}

variable "endpoints_enable" {
  default = ""
}

variable "service_endpoints" {
  default = [""]
}

variable "azrpm-dev-vnet01_allow_virtual_network_access" {
  default = [""]
}
variable "azrpm-dev-vnet01_allow_forwarded_traffic" {
  default = [""]
}
variable "azrpm-dev-vnet01_allow_gateway_transit" {
  default = [""]
}
variable "azrpm-hub-vnet01-to-azrpm-dev-vnet01" {
  default = [""]
}
variable "vnet_allow_gateway_transit" {
  default = [""]
}
variable "azrpm-dev-vnet01_gateway_transit" {
  default = [""]
}