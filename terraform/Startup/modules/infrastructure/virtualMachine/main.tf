resource "azurerm_linux_virtual_machine" "VirtualMachine"{
  name = "${var.vmName}VirtualMachine"
  resource_group_name = var.ResourceGroupName
  location = var.location
  size = var.VMsize
  admin_username = var.adminuser
  network_interface_ids = [
    var.networkInterfaceID,
  ]

  admin_ssh_key {
    username   = var.adminuser
    public_key = file("/home/tom/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}