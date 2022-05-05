resource "azurerm_public_ip" "PUBLIC-PROD-0" {
  name                = "PUBLIC-PROD-0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "PUBLIC-QA-0" {
  name                = "PUBLIC-QA-0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "PUBLIC-DEV-0" {
  name                = "PUBLIC-DEV-0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}