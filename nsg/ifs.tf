resource "azurerm_network_interface" "IF-PROD-0" {
  name                = "IF-PROD-0"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "IP-PROD-0"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.SUBNET-PROD-0.id
    public_ip_address_id          = azurerm_public_ip.PUBLIC-PROD-0.id
  }
}
resource "azurerm_network_interface" "IF-PROD-1" {
  name                = "IF-PROD-1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "IP-PROD-1"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.SUBNET-PROD-0.id
    public_ip_address_id          = azurerm_public_ip.PUBLIC-PROD-1.id
  }
}
#resource "azurerm_network_interface" "IF-QA-1" {
#  name                = "IF-QA-1"
#  location            = var.location
#  resource_group_name = azurerm_resource_group.rg.name
#
#  ip_configuration {
#    name                          = "IP-QA-1"
#    private_ip_address_allocation = "Dynamic"
#    subnet_id                     = azurerm_subnet.SUBNET-QA-0.id
#    public_ip_address_id          = azurerm_public_ip.PUBLIC-QA-0.id
#  }
#}
#resource "azurerm_network_interface" "IF-DEV-0" {
#  name                = "IF-DEV-0"
#  location            = var.location
#  resource_group_name = azurerm_resource_group.rg.name
#
#  ip_configuration {
#    name                          = "IP-DEV-0"
#    private_ip_address_allocation = "Dynamic"
#    subnet_id                     = azurerm_subnet.SUBNET-DEV-0.id
#    public_ip_address_id          = azurerm_public_ip.PUBLIC-DEV-0.id
#  }
#}

resource "azurerm_application_security_group" "ASG-PROD0" {
  location            = var.location
  name                = "ASG-PROD0"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_application_security_group" "ASG-QA0" {
  location            = var.location
  name                = "ASG-QA0"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_application_security_group" "ASG-DEV0" {
  location            = var.location
  name                = "ASG-DEV0"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_interface_application_security_group_association" "ASG-PROD0" {
  network_interface_id          = azurerm_network_interface.IF-PROD-0.id
  application_security_group_id = azurerm_application_security_group.ASG-PROD0.id
}
resource "azurerm_network_interface_application_security_group_association" "ASG-PROD1" {
  network_interface_id          = azurerm_network_interface.IF-PROD-1.id
  application_security_group_id = azurerm_application_security_group.ASG-PROD0.id
}