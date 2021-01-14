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
    Name = var.JenkinsName

    resourceGroupReference = module.resourceGroup.resourceGroupReference
    VNName = module.virtualNetwork.VNName
}

module "JenkinsvirtualMachine"{
    source = "./virtualMachine"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.JenkinsVMsize
    adminuser = var.adminuser
    vmName = var.JenkinsName

    networkInterfaceID = module.jenkinsNetworkConfig.networkInterfaceID
}

module "testEnvNetworkConfig"{
    source = "./networkConfig"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    subnetPrefix = var.testEnvSubnetPrefixe
    Name = var.testName

    resourceGroupReference = module.resourceGroup.resourceGroupReference
    VNName = module.virtualNetwork.VNName
}

module "TestEnvvirtualMachine"{
    source = "./virtualMachine"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.testEnvVMsize
    adminuser = var.adminuser
    vmName = var.testName

    networkInterfaceID = module.testEnvNetworkConfig.networkInterfaceID
}