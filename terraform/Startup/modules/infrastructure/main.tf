module "resourceGroup" {
    source = "./resourceGroup"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
}

module "virtualNetwork"{
    source = "./virtualNetwork"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    
    resourceGroupReference = module.resourceGroup.resourceGroupReference
}

module "jenkinsNetworkConfig"{
    source = "./networkConfig"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    subnetPrefix = var.JenkinsSubnetPrefixe

    resourceGroupReference = module.resourceGroup.resourceGroupReference
    VNName = module.virtualNetwork.VNName
}

module "JenkinsvirtualMachine"{
    source = "./virtualMachine"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.JenkinsVMsize
    adminuser = var.adminuser
    vmName = var.JenkinsVMname

    networkInterfaceID = module.jenkinsNetworkConfig.networkInterfaceID
}

module "testEnvNetworkConfig"{
    source = "./networkConfig"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    subnetPrefix = var.testEnvSubnetPrefixe

    resourceGroupReference = module.resourceGroup.resourceGroupReference
    VNName = module.virtualNetwork.VNName
}

module "TestEnvvirtualMachine"{
    source = "./virtualMachine"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.testEnvVMsize
    adminuser = var.adminuser
    vmName = var.testEnvVMname

    networkInterfaceID = module.testEnvNetworkConfig.networkInterfaceID
}