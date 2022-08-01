variable "resource_group_name" {
  default     = ""
  description = "Name of the resource group"
}

variable "location" {
  default     = "westus"
  description = "Geographic location of the Resource Group"
}

variable "akv_name" {
  default     = [""]
  description = "Network Security Group"
}

variable "tenant_id" {
  default     = [""]
  description = "Network Security Group"
}

variable "object_id" {
  default     = [""]
}
