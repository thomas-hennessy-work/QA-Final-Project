resource "azurerm_virtual_network" "testEnvVN"{
  name = "testEnvNetwork"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.ResourceGroupName
  depends_on              = [var.resourceGroupReference]
}

resource "azurerm_subnet" "testEnvSubnet"{
  name = "testEnvSubnet"
  resource_group_name = var.ResourceGroupName
  virtual_network_name = azurerm_virtual_network.testEnvVN.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "testEnvPubIP" {
  name                = "testEnvPubIP"
  resource_group_name = var.ResourceGroupName
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on              = [var.resourceGroupReference]
}

resource "azurerm_network_interface" "testEnvNetInt"{
  name = "testEnvNetInt"
  location = var.location
  resource_group_name = var.ResourceGroupName

  ip_configuration {
    name = "testEnvIPConfig"
    subnet_id = azurerm_subnet.testEnvSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.testEnvPubIP.id
  }
}