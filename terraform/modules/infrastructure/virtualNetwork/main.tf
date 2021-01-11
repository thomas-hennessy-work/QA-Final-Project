resource "azurerm_virtual_network" "AKSVirtualNetwork" {
  name                = "AKSVirtualNetwork"
  resource_group_name = var.ResourceGroupName
  location            = "UK South"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "AKSSubnet" {
  name                 = "AKSSubnet"
  resource_group_name  = var.ResourceGroupName
  virtual_network_name = azurerm_virtual_network.AKSVirtualNetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}