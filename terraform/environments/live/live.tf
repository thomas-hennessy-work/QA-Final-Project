variable "ResourceGroupName"{
}
variable "instanceAmount"{
}

provider "azurerm" {
  features {}
}

module "infrastructure" {
    source = "../../modules/infrastructure"
    ResourceGroupName = var.ResourceGroupName
    instanceAmount = var.instanceAmount
}