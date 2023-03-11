variable "location" {
  default = "eastus"
}
variable "vnet_name" {
  default = "defaultvnet"
}

variable "resource_group_name" {
  default = "defaultresourcegroup"
}
variable "address" {
  default = ["10.0.0.0/16"]
}
variable "address_prefixes" {
  default = ["10.0.0.1/24"]
}