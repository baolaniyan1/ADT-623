resource "azurerm_machine_learning_workspace" "example" {
  name                    = var.ml_workspace_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  application_insights_id = var.app_insights_id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id
  identity {
    type = "${var.identity_type}"
  }
}
