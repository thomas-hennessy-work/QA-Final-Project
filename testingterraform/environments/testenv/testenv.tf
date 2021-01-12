variable "location"{
}
variable "ResourceGroupName" {
}
variable "VMsize"{
}
variable "adminuser"{
}

provider "azurerm" {
  features {}
}

module "infrastructure" {
    source = "../../modules/infrastructure"

    location = var.location
    ResourceGroupName = var.ResourceGroupName
    VMsize = var.VMsize
    adminuser = var.adminuser
}