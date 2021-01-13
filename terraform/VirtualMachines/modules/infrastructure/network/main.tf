resource "azurerm_virtual_network" "testEnvVN"{
  //Prevents the network from being created if specified
  count = var.createNetwork ? 1 : 0
  name = "testEnvNetwork"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.ResourceGroupName
  depends_on              = [var.resourceGroupReference]
}

resource "azurerm_subnet" "testEnvSubnet"{
  count = var.createNetwork ? 1 : 0
  name = "testEnvSubnet"
  resource_group_name = var.ResourceGroupName
  virtual_network_name = azurerm_virtual_network.testEnvVN[count.index].name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "testEnvPubIP" {
  count = var.createNetwork ? 1 : 0
  name                = "testEnvPubIP"
  resource_group_name = var.ResourceGroupName
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on              = [var.resourceGroupReference]
}

resource "azurerm_network_interface" "testEnvNetInt"{
  count = var.createNetwork ? 1 : 0
  name = "testEnvNetInt"
  location = var.location
  resource_group_name = var.ResourceGroupName

  ip_configuration {
    name = "testEnvIPConfig"
    subnet_id = azurerm_subnet.testEnvSubnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.testEnvPubIP[count.index].id
  }
}