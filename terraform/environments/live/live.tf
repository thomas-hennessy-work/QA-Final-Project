variable "ResourceGroupName" {
}
variable "instanceAmount" {
}
variable "vmsize"{
}

provider "azurerm" {
  features {}
}

module "infrastructure" {
  source            = "../../modules/infrastructure"
  ResourceGroupName = var.ResourceGroupName
  instanceAmount    = var.instanceAmount
  vmsize = var.vmsize
}