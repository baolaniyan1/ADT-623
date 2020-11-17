resource "azurerm_application_insights" "example" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group
  application_type    = var.application_type
}
