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
resource "azurerm_network_interface" "IF-PROD-2" {
  name                = "IF-PROD-2"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "IP-PROD-2"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.SUBNET-PROD-1.id
    public_ip_address_id          = azurerm_public_ip.PUBLIC-PROD-2.id
  }
}
resource "azurerm_network_interface" "IF-PROD-3" {
  name                = "IF-PROD-3"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "IP-PROD-3"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.SUBNET-PROD-1.id
    public_ip_address_id          = azurerm_public_ip.PUBLIC-PROD-3.id
  }
}



resource "azurerm_application_security_group" "ASG-WEB" {
  location            = var.location
  name                = "ASG-WEB"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_application_security_group" "ASG-APP" {
  location            = var.location
  name                = "ASG-APP"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_application_security_group" "ASG-DB" {
  location            = var.location
  name                = "ASG-DB"
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_network_interface_application_security_group_association" "ASGWEB-PROD0" {
  application_security_group_id = azurerm_application_security_group.ASG-WEB.id
  network_interface_id          = azurerm_network_interface.IF-PROD-0.id
}
resource "azurerm_network_interface_application_security_group_association" "ASGWEB-PROD1" {
  application_security_group_id = azurerm_application_security_group.ASG-WEB.id
  network_interface_id          = azurerm_network_interface.IF-PROD-1.id
}
resource "azurerm_network_interface_application_security_group_association" "ASGWEB-PROD2" {
  application_security_group_id = azurerm_application_security_group.ASG-APP.id
  network_interface_id          = azurerm_network_interface.IF-PROD-2.id
}
resource "azurerm_network_interface_application_security_group_association" "ASGWEB-PROD3" {
  application_security_group_id = azurerm_application_security_group.ASG-DB.id
  network_interface_id          = azurerm_network_interface.IF-PROD-3.id
}