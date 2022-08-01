variable "rg_name" {
  default     = ""
  description = "Name of the resource group"
}

variable "location" {
  default     = "eastus"
  description = "Geographic location of the Resource Group"
}

variable "winjmphosts_count_pubIP" {
      default = "2"
      description = "WinVMcount"
}

# variable "nicname" {
#   default     = ""
#   description = "NIC Name"
# }

variable "count_offset" {
  default     = 0
  description = "Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,..."
}

variable "count_format" {
  default     = "%02d"
  description = "Server numbering format (-01, -02, etc.) in printf format"
}

variable "subnet_id" {
      default = ""
      description = " Subnet ID "
}

variable "public_ip_address_id" {
      default = ""
      description = " Public IP "
}