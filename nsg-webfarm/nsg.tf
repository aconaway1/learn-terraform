resource "azurerm_network_security_group" "NSG-PROD-SUBNET-0" {
  location            = var.location
  name                = "NSG-PROD-SUBNET-0"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "INBOUND-WEB" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-0.name

  name                                       = "INBOUND-WEB"
  direction                                  = "Inbound"
  priority                                   = 500
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  source_address_prefix                      = "*"
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-WEB.id]
  destination_port_range                     = "22"
}

resource "azurerm_network_security_rule" "PROD-SUBNET-0-WEB-APP" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-0.name

  name                                       = "PROD-SUBNET-0-WEB-APP"
  direction                                  = "Outbound"
  priority                                   = 600
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  source_application_security_group_ids      = [azurerm_application_security_group.ASG-WEB.id]
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-APP.id]
  destination_port_range                     = "*"
}

resource "azurerm_subnet_network_security_group_association" "NSGA-PROD-SUBNET-0" {
  network_security_group_id = azurerm_network_security_group.NSG-PROD-SUBNET-0.id
  subnet_id                 = azurerm_subnet.SUBNET-PROD-0.id
}

resource "azurerm_network_security_group" "NSG-PROD-SUBNET-1" {
  location            = var.location
  name                = "NSG-PROD-SUBNET-1"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "PROD-SUBNET-1-WEB-APP" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-1.name

  name                                       = "PROD-SUBNET-1-WEB-APP"
  direction                                  = "Inbound"
  priority                                   = 500
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  source_application_security_group_ids      = [azurerm_application_security_group.ASG-WEB.id]
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-APP.id]
  destination_port_range                     = "*"
}

resource "azurerm_network_security_rule" "PROD-SUBNET-1-DENY" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-1.name

  name                                       = "PROD-SUBNET-1-DENY"
  direction                                  = "Inbound"
  priority                                   = 600
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_application_security_group_ids      = [azurerm_application_security_group.ASG-WEB.id]
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-DB.id]
  destination_port_range                     = "*"
}

resource "azurerm_network_security_rule" "PROD-SUBNET-1-APP-DB" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-1.name

  name                                       = "PROD-SUBNET-1-APP-DB"
  direction                                  = "Inbound"
  priority                                   = 700
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  source_application_security_group_ids      = [azurerm_application_security_group.ASG-APP.id]
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-DB.id]
  destination_port_range                     = "*"
}

resource "azurerm_network_security_rule" "PROD-SUBNET-1-APP-DB-DENY" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-PROD-SUBNET-1.name

  name                                       = "PROD-SUBNET-1-APP-DB-DENY"
  direction                                  = "Inbound"
  priority                                   = 800
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_application_security_group_ids      = [azurerm_application_security_group.ASG-APP.id]
  destination_application_security_group_ids = [azurerm_application_security_group.ASG-DB.id]
  destination_port_range                     = "*"
}

resource "azurerm_subnet_network_security_group_association" "NSGA-PROD-SUBNET-1" {
  network_security_group_id = azurerm_network_security_group.NSG-PROD-SUBNET-1.id
  subnet_id                 = azurerm_subnet.SUBNET-PROD-1.id
}