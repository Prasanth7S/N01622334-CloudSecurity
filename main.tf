module "resource_group" {
  source     = "/home/vishal/automation/terraform/lab06/modules/resource_group"
  network-rg = "network-rg"
  linux-rg   = "linux-rg"
  windows-rg = "windows-rg"
  location   = "canadacentral"
}

module "network" {
  source              = "/home/vishal/automation/terraform/lab07s1/modules/network"
  network_rg_location = module.resource_group.network_rg_location
  network_rg_name     = module.resource_group.network_rg_name
}

module "linux" {
  source            = "/home/vishal/automation/terraform/lab07s1/modules/linux"
  linux_rg_location = module.resource_group.linux_rg_location
  linux_rg_name     = module.resource_group.linux_rg_name
  subnet1_id        = module.network.subnet1_id
}

module "windows" {
  source              = "/home/vishal/automation/terraform/lab07s1/modules/windows"
  windows_rg_location = module.resource_group.windows_rg_location
  windows_rg_name     = module.resource_group.windows_rg_name
  subnet2_id          = module.network.subnet2_id
}
