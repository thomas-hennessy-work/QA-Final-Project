variable "location"{
}
variable "ResourceGroupName" {
}

variable "JenkinsVMsize"{
}
variable "JenkinsVMname" {
}

variable "testEnvVMsize" {
}
variable "testEnvVMname" {
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
    
    testEnvVMsize = var.testEnvVMsize
    testEnvVMname = var.testEnvVMname

    adminuser = var.adminuser
}