variable "location"{
}
variable "ResourceGroupName" {
}

variable "JenkinsName"{
}
variable "JenkinsVMsize"{
}
variable "JenkinsSubnetPrefixe" {
}

variable "testName" {
}
variable "testEnvVMsize" {
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
    JenkinsSubnetPrefixe = var.JenkinsSubnetPrefixe
    
    testEnvVMsize = var.testEnvVMsize
    testEnvSubnetPrefixe = var.testEnvSubnetPrefixe

    JenkinsName = var.JenkinsName
    testName = var.testName

    adminuser = var.adminuser
}

output "JenkinsIpAddress" {
  value = module.infrastructure.IPAddress
}