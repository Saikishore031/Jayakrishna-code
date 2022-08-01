variable "resource_group_name" {
  default     = ""
  description = "Name of the resource group"
}

variable "location" {
  default     = "westus"
  description = "Geographic location of the Resource Group"
}

variable "acr_name" {
  default     = [""]
  description = "Network Security Group"
}

variable "acr_sku" {
  default     = [""]
  description = "Network Security Group"
}

variable "admin_enabled" {
  default     = [""]
}

variable "georeplication_locations" {
  default     = [""]
}