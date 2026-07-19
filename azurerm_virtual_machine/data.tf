data "azurerm_subnet" "example-subnet" {
  for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "example-pip" {
  for_each = var.pips
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
