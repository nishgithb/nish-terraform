# resource "azurerm_resource_group" "nish-rg" {
#   name = "bd9g-rg1"
#   location = "Central US"
# }
#using existing resource group
data "azurerm_resource_group" "nish-existing-rg" {
name = "nish-rg-manual"
}



