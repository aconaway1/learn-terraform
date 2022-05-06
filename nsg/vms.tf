resource "azurerm_linux_virtual_machine" "VM-PROD-0" {
  name                = "VM-PROD-0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = "Standard_B1s"
  #  size                = "Standard_F2"
  admin_username = "jac"
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
  name                = "VM-PROD-1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = "Standard_B1s"
  #  size                = "Standard_F2"
  admin_username = "jac"
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

#resource "azurerm_linux_virtual_machine" "VM-QA-1" {
#  name                = "VM-QA-1"
#  resource_group_name = azurerm_resource_group.rg.name
#  location            = var.location
#  size                = "Standard_F2"
#  admin_username      = "jac"
#  network_interface_ids = [
#    azurerm_network_interface.IF-QA-1.id
#  ]
#
#  admin_ssh_key {
#    username   = "jac"
#    public_key = file("./id_rsa.pub")
#  }
#
#  os_disk {
#    caching              = "ReadWrite"
#    storage_account_type = "Standard_LRS"
#  }
#
#  source_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#}