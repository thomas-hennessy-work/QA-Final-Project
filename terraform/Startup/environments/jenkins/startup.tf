variable "location"{
}
variable "ResourceGroupName" {
}

variable "JenkinsVMsize"{
}
variable "JenkinsVMname" {
}
variable "JenkinsSubnetPrefixe" {
}

variable "testEnvVMsize" {
}
variable "testEnvVMname" {
}
variable "testEnvSubnetPrefixe" {
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

    JenkinsVMsize = var.JenkinsVMsize
    JenkinsVMname = var.JenkinsVMname
    JenkinsSubnetPrefixe = var.JenkinsSubnetPrefixe
    
    testEnvVMsize = var.testEnvVMsize
    testEnvVMname = var.testEnvVMname
    testEnvSubnetPrefixe = var.testEnvSubnetPrefixe

    adminuser = var.adminuser
}