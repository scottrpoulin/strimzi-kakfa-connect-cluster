data "terraform_remote_state" "aks" {
  backend = "azurerm"
  config = {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = data.terraform_remote_state.aks.outputs.kubernetes_cluster_name
  resource_group_name = data.terraform_remote_state.aks.outputs.resource_group_name
}