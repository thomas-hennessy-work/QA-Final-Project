resource "azurerm_virtual_network" "ScaleSetVirtualNetwork" {
  name                = "ScaleSetVirtualNetwork"
  resource_group_name = var.ResourceGroupName
  location            = "UK South"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "VMSSSubnet" {
  name                 = "VMSSSubnet"
  resource_group_name  = var.ResourceGroupName
  virtual_network_name = azurerm_virtual_network.ScaleSetVirtualNetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}