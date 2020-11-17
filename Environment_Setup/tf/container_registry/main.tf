resource "azurerm_container_registry" "aml" {
  name                     = "${var.service_tier}-${var.data_persona}-${var.storage_tier}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  # SKU types are basic standard premium and classic
  sku                      = var.container_registry_sku
  admin_enabled            = var.admin_enabled
}
