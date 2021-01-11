variable "ResourceGroupName"{
}

variable "instanceAmount"{
}

variable "netSecID"{
    module.vmss.SecurityGroupID
}