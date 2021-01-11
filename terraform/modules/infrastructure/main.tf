module "resourceGroup" {
  source = "./resourceGroup"

  ResourceGroupName = var.ResourceGroupName
}

module "virtualNetwork" {
  source = "./virtualNetwork"

  ResourceGroupName = var.ResourceGroupName
}

module "aksCluster" {
  source = "./aksCluster"

  ResourceGroupName = var.ResourceGroupName
  instanceAmount    = var.instanceAmount
  vmsize = var.vmsize
}