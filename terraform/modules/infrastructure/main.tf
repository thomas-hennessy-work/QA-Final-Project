module "resourceGroup"{
    source = "./resourceGroup"

    ResourceGroupName = var.ResourceGroupName
}

module "virtualNetwork"{
    source = "./virtualNetwork"

    ResourceGroupName = var.ResourceGroupName
}

module "vmss"{
    source = "./vmss"

    ResourceGroupName = var.ResourceGroupName
    instanceAmount = var.instanceAmount
}