resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  for_each = var.subnet_nsg_associations
  subnet_id                 = data.azurerm_subnet.example-subnet[each.value.subnet_id].id
  network_security_group_id = data.azurerm_network_security_group.example-nsg[each.value.nsg_id].id
}