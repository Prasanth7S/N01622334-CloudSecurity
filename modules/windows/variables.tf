variable "windows_avs" {
  default = "lab-db1-u-vm"
}

variable "subnet2_id" {}
variable "windows_rg_name" {}
variable "windows_rg_location" {}

variable "windows_name" {
  type = map(string)

  default = {
    "n01619861-w-vm1" = "Standard_B1s"
  }
}

variable "windows_admin_username" {
  default = "vishal"
}

variable "windows_admin_password" {
  default = "asdfgfd@1231"
}

variable "windows_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "windows_os_disk_storage_account_type" {
  default = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
  default = 128
}

variable "windows_os_disk_caching" {
  default = "ReadWrite"
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}


