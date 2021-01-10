variable "ResourceGroupName"{
}

variable "instanceAmount"{
}

variable "netSecID"{
    value = azurerm_network_security_group.VMSSSecurityGroup.id
}