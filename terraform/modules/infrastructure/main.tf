module "resourceGroup" {
  source = "./resourceGroup"

  ResourceGroupName = var.ResourceGroupName
}

module "virtualNetwork" {
  source = "./virtualNetwork"

  ResourceGroupName = var.ResourceGroupName
}

# module "vmss" {
#   source = "./vmss"

#   ResourceGroupName = var.ResourceGroupName
#   instanceAmount    = var.instanceAmount
#   SecurityGroupID   = module.resourceGroup.SecurityGroupID
#   VMSSID            = module.virtualNetwork.VMSSID
# }

module "aksCluster" {
  source = "./aksCluster"

  ResourceGroupName = var.ResourceGroupName
  instanceAmount    = var.instanceAmount
  vmsize = var.vmsize
}