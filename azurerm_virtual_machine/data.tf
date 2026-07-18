data "azurerm_network_interface" "nic" {
  for_each = var.network_interfaces
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}