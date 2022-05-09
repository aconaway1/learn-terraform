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
#
# The QA VNET
#
#resource "azurerm_virtual_network" "VNET-QA" {
#  name                = "VNET-QA"
#  address_space       = ["10.1.0.0/16"]
#  location            = var.location
#  resource_group_name = azurerm_resource_group.rg.name
#}
#resource "azurerm_subnet" "SUBNET-QA-0" {
#  name                 = "SUBNET-QA-0"
#  resource_group_name  = azurerm_resource_group.rg.name
#  virtual_network_name = azurerm_virtual_network.VNET-QA.name
#  address_prefixes     = ["10.1.0.0/24"]
#}
#
# The DEV VNET
#
#resource "azurerm_virtual_network" "VNET-DEV" {
#  name                = "VNET-DEV"
#  address_space       = ["10.2.0.0/16"]
#  location            = var.location
#  resource_group_name = azurerm_resource_group.rg.name
#}
#resource "azurerm_subnet" "SUBNET-DEV-0" {
#  name                 = "SUBNET-DEV-0"
#  resource_group_name  = azurerm_resource_group.rg.name
#  virtual_network_name = azurerm_virtual_network.VNET-DEV.name
#  address_prefixes     = ["10.2.0.0/24"]
#}
#
# The HUB VNET
#
#resource "azurerm_virtual_wan" "VWAN0" {
#  location            = var.location
#  name                = "VWAN0"
#  resource_group_name = azurerm_resource_group.rg.name
#}
#resource "azurerm_virtual_hub" "VWAN0-VHUB-0" {
#  name                = "VWAN0-VHUB-0"
#  resource_group_name = azurerm_resource_group.rg.name
#  location            = var.location
#  virtual_wan_id      = azurerm_virtual_wan.VWAN0.id
#  address_prefix      = "10.200.0.0/24"
#}
##
## Connect everything to the hub
##
#resource "azurerm_virtual_hub_connection" "CONN-HUB0-PROD" {
#  name                      = "CONN-HUB0-PROD"
#  virtual_hub_id            = azurerm_virtual_hub.VWAN0-VHUB-0.id
#  remote_virtual_network_id = azurerm_virtual_network.VNET-PROD.id
#}
#resource "azurerm_virtual_hub_connection" "CONN-HUB0-QA" {
#  name                      = "CONN-HUB0-WA"
#  virtual_hub_id            = azurerm_virtual_hub.VWAN0-VHUB-0.id
#  remote_virtual_network_id = azurerm_virtual_network.VNET-QA.id
#}
#resource "azurerm_virtual_hub_connection" "CONN-HUB0-DEV" {
#  name                      = "CONN-HUB0-DEV"
#  virtual_hub_id            = azurerm_virtual_hub.VWAN0-VHUB-0.id
#  remote_virtual_network_id = azurerm_virtual_network.VNET-DEV.id
#}