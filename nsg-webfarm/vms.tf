resource "azurerm_linux_virtual_machine" "VM-PROD-0" {
  name                = "WEB0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags = var.tags

  size                = "Standard_B1s"
  admin_username      = "jac"
  network_interface_ids = [
    azurerm_network_interface.IF-PROD-0.id
  ]

  admin_ssh_key {
    username   = "jac"
    public_key = file("./id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "VM-PROD-1" {
  name                = "WEB1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags = var.tags

  size                = "Standard_B1s"
  admin_username      = "jac"
  network_interface_ids = [
    azurerm_network_interface.IF-PROD-1.id
  ]

  admin_ssh_key {
    username   = "jac"
    public_key = file("./id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "VM-PROD-2" {
  name                = "APP0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags = var.tags

  size                = "Standard_B1s"
  admin_username      = "jac"
  network_interface_ids = [
    azurerm_network_interface.IF-PROD-2.id
  ]

  admin_ssh_key {
    username   = "jac"
    public_key = file("./id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "VM-PROD-3" {
  name                = "DB0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags = var.tags

  size                = "Standard_B1s"
  admin_username      = "jac"
  network_interface_ids = [
    azurerm_network_interface.IF-PROD-3.id
  ]

  admin_ssh_key {
    username   = "jac"
    public_key = file("./id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}