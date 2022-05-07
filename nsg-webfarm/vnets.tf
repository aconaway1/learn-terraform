#
# The PROD VNET
#
resource "azurerm_virtual_network" "VNET-PROD" {
  name                = "VNET-PROD"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "SUBNET-PROD-0" {
  name                 = "SUBNET-PROD-0"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.VNET-PROD.name
  address_prefixes     = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "SUBNET-PROD-1" {
  name                 = "SUBNET-PROD-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.VNET-PROD.name
  address_prefixes     = ["10.0.1.0/24"]
}
