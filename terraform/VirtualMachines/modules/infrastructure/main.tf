module "resourceGroup" {
    source = "./resourceGroup"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    createResourceGroup = var.createResourceGroup
}

module "network"{
    source = "./network"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    resourceGroupReference = module.resourceGroup.resourceGroupReference
    createNetwork = var.createNetwork
}

module "virtualMachine"{
    source = "./virtualMachine"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.VMsize
    adminuser = var.adminuser
    networkInterfaceID = module.network.networkInterfaceID
}