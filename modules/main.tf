module "resource_group" {
  source = "../azurerm_resource_group"
  rgs = var.rgs
}

module "storage_account" {
    depends_on = [module.resource_group]
  source = "../azurerm_storage_account"
  stgs = var.stgs
}

module "virtual_network" {
    depends_on = [module.resource_group]
  source = "../azurerm_virtual_network"
  vnets = var.vnets
}

module "subnet" {
    depends_on = [module.virtual_network]
  source = "../azurerm_subnet"
  subnets = var.subnets
}


module "public_ip" {
  depends_on = [module.resource_group]
  source = "../azurerm_public_ip"
  pips = var.pips
}
module "virtual_machine" {
      depends_on = [ module.subnet, module.public_ip ]
      source = "../azurerm_virtual_machine"
      vms = var.vms
      subnets = var.subnets
      pips =var.pips

}
module "network_security_group" {
      depends_on = [module.resource_group]
      source = "../azurerm_nsg"
      nsgs = var.nsgs
}
module "subnet_nsg_association" {
      depends_on = [module.subnet, module.network_security_group]
      source = "../azurerm_subnet_nsg_association"
      subnet_nsg_associations = var.subnet_nsg_associations
      nsgs = var.nsgs
      subnets = var.subnets
}