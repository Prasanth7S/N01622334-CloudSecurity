locals {
  common_tags = {
    Name : "Terraform_Lab"
    Project : "Practice"
    ContactEmail : "n01619861@humber.ca"
    Environment : "Lab"
  }
}

variable "subnet1_id" {
  default = "subnet1_id"
}

variable "linux_rg_name" {}

variable "linux_rg_location" {}

variable "linux_name" {
  default = "n01619861-u-vm"
}

variable "nb_count" {
  default = "2"
}

variable "linux_avs" {
  default = "lab-db1-u-vm"
}

variable "linux_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "vishal"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  default = "Premium_LRS"
}

variable "os_disk_size" {
  default = 32
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "linux_publisher" {
  default = "OpenLogic"
}

variable "linux_offer" {
  default = "CentOS"
}

variable "linux_sku" {
  default = "8_2"
}

variable "linux_version" {
  default = "latest"
}


