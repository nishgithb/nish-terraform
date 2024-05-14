#creating azure windows virtual machine
resource "azurerm_windows_virtual_machine" "Windows-VM" {
name = "bd9g-win-vm1"
resource_group_name = data.azurerm_resource_group.nish-existing-rg.name
location = data.azurerm_resource_group.nish-existing-rg.location
admin_username = "nishitha"
admin_password = "Welcome@123"
network_interface_ids = [azurerm_network_interface.bd9g-network-interface.id]
size = "Standard_D2lds_v5"
os_disk {
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
}
source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}