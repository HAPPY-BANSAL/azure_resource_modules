data "azurerm_network_security_group" "example-nsg" {
  for_each = var.nsgs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  
}

data "azurerm_subnet" "example-subnet" {
  for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}