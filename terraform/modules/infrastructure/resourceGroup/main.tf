resource "azurerm_resource_group" "ResourceGroup" {
  name     = var.ResourceGroupName
  location = "UK South"
}

resource "azurerm_network_security_group" "AKSSecurityGroup" {
  name                = "AKSSecurityGroup"
  location            = "UK South"
  resource_group_name = var.ResourceGroupName
  depends_on          = [azurerm_resource_group.ResourceGroup]

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
}