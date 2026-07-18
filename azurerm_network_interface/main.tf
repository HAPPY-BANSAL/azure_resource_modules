resource "azurerm_network_interface" "example-nic" {
  for_each = var.network_interfaces
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example-subnet[each.value.subnet_id].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.example-pip[each.value.pip_id].id
  }
}