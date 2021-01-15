resource "azurerm_kubernetes_cluster" "aks" {
  name                    = "aks_cluster"
  location                = "UK South"
  resource_group_name     = var.ResourceGroupName
  dns_prefix              = "k8s"
  private_cluster_enabled = false
  depends_on              = [var.resourceGroupReference]

  default_node_pool {
    name            = "aksnodepool"
    node_count      = var.instanceAmount
    vm_size         = var.vmsize
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

}