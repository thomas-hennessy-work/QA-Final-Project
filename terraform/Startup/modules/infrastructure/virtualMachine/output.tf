output "IPAddress" {
    value = data.azurerm_public_ip.ipAddressData.ip_address
}
