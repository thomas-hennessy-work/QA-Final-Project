resource "azurerm_resource_group" "TestEnvResourceGroup" {
  name     = var.ResourceGroupName
  location = var.location
}

resource "azurerm_network_security_group" "TestEnvSecurityGroup" {
  name                = "TestEnvSecurityGroup"
  location = var.location
  resource_group_name = var.ResourceGroupName
  depends_on          = [azurerm_resource_group.TestEnvResourceGroup]

  security_rule {
    name                       = "allowSSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "open8080"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}