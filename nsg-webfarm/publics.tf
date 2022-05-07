resource "azurerm_public_ip" "PUBLIC-PROD-0" {
  name                = "PUBLIC-PROD-0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "PUBLIC-PROD-1" {
  name                = "PUBLIC-PROD-1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "PUBLIC-PROD-2" {
  name                = "PUBLIC-PROD-2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "PUBLIC-PROD-3" {
  name                = "PUBLIC-PROD-3"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}