output "networkInterfaceID"{
    value = azurerm_network_interface.testEnvNetInt.*.id
}