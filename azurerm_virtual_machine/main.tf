resource "azurerm_network_interface" "example-nic" {
  for_each = var.vms
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

resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vms
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    network_interface_ids = [azurerm_network_interface.example-nic[each.key].id]
    disable_password_authentication = false

    source_image_reference {
        publisher = each.value.source_image_publisher
        offer     = each.value.source_image_offer
        sku       = each.value.source_image_sku
        version   = each.value.source_image_version
    }

    os_disk {
        caching = each.value.os_disk_caching
        storage_account_type = each.value.os_disk_storage_account_type
    }
}