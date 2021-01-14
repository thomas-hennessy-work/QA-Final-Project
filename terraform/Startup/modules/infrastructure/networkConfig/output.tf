output "networkInterfaceID"{
    value = azurerm_network_interface.testEnvNetInt.id
}

output "IPAddresName" {
    value = azurerm_public_ip.testEnvPubIP.name
}