#creating azure network
resource "azurerm_virtual_network" "bd9g-az-vnet" {
resource_group_name = data.azurerm_resource_group.nish-existing-rg.name
location = data.azurerm_resource_group.nish-existing-rg.location
name = "bd9g-network"
address_space = ["10.0.0.0/16"]
}
#create internal subnet
resource "azurerm_subnet" "bd9g-subnet" {
  name = "bd9g-internal-subnet"
  virtual_network_name = azurerm_virtual_network.bd9g-az-vnet.name
  resource_group_name = data.azurerm_resource_group.nish-existing-rg.name
  address_prefixes = [ "10.0.1.0/24" ]
}
#create network interface
resource "azurerm_network_interface" "bd9g-network-interface" {
  name = "bd9g-network-interface"
  resource_group_name = data.azurerm_resource_group.nish-existing-rg.name
  location = data.azurerm_resource_group.nish-existing-rg.location
 ip_configuration {
   subnet_id = azurerm_subnet.bd9g-subnet.id
   private_ip_address_allocation = "Dynamic"
   public_ip_address_id = azurerm_public_ip.bd9g-public-ip1.id #integrating public ip inside existing network interface
   name = "bd9g-nic1"
 }
}
#create public ip
resource "azurerm_public_ip" "bd9g-public-ip1" {
  name = "bd9g-public-ip"
  resource_group_name = data.azurerm_resource_group.nish-existing-rg.name
  location = data.azurerm_resource_group.nish-existing-rg.location
  allocation_method = "Static"
}