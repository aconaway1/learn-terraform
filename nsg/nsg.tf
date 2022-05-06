resource "azurerm_network_security_group" "NSG0" {
  location            = var.location
  name                = "NSG0"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "PERMIT_SSH" {
  name                                       = "PERMIT_SSH"
  resource_group_name                        = azurerm_resource_group.rg.name
  access                                     = "Allow"
  direction                                  = "Inbound"
  network_security_group_name                = azurerm_network_security_group.NSG0.name
  priority                                   = 500
  protocol                                   = "Tcp"
  source_address_prefix                      = "*"
  source_port_range                          = "*"
  destination_port_range                     = "22"
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-PROD0.id]
}

resource "azurerm_subnet_network_security_group_association" "NSG0-PROD0" {
  subnet_id                 = azurerm_subnet.SUBNET-PROD-0.id
  network_security_group_id = azurerm_network_security_group.NSG0.id
}