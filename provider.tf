provider "azurerm" {
  version = "=2.0.0"
features{}
}

export ARM_SUBSCRIPTION_ID = var.subscription_id
export ARM_CLIENT_ID = var.client_id
export ARM_CLIENT_SECRET = var.client_secret
export ARM_TENANT_ID = var.tenant_id

