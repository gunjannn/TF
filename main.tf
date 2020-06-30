resource "azurerm_resource_group" "example" {
  name     = "vm-rg"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "k8s-bg" {
  name                = "k8s-bg"
  location            = "Canada Central"
  resource_group_name = "vm-rg"
  dns_prefix          = "k8sbg1"
  
  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "test"
  }
  
service_principal {
  client_id     = "${var.client_id}"
  client_secret = "${var.client_secret}"
  }

/*output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}*/

output "kube_config" {
  value = azurerm_kubernetes_cluster.kube_config_raw
}
}
