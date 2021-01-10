resource "azurerm_linux_virtual_machine_scale_set" "VMSS" {
  name                = "VMSS"
  resource_group_name = var.ResourceGroupName
  location            = "UK South"
  sku                 = "Standard_F1"
  instances           = var.instanceAmount
  admin_username      = "adminUser"

  admin_ssh_key {
    username   = "adminUser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                      = "VMSSNetwork-Interface"
    primary                   = true
    network_security_group_id = azurerm_network_security_group.VMSSSecurityGroup.id

    ip_configuration {
      name      = "internalIPConfig"
      primary   = true
      subnet_id = azurerm_subnet.VMSSSubnet.id

      public_ip_address {
        name = "pubIPConfig"
      }
    }
  }
}