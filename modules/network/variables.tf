variable "network_rg_name" {}
variable "network_rg_location" {}

variable "vnet_name" {
  default = "network-vnet"
}

variable "vnet_aspace" {
  default = ["10.0.0.0/16"]
}

variable "subnet1" {
  default = "network-subnet1"
}

variable "subnet2" {
  default = "network-subnet2"
}

variable "subnet1_aspace" {
  default = ["10.0.0.0/24"]
}

variable "subnet2_aspace" {
  default = ["10.0.1.0/24"]
}

variable "nsg1" {
  default = "network-nsg1"
}

variable "nsg2" {
  default = "network-nsg2"
}

