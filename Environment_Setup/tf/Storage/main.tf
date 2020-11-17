provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "aml" {
  name                     = "${var.service_tier}-${var.data_persona}-${var.storage_tier}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  # Valid options are Standard and Premium. For BlockBlobStorage and FileStorage
  account_tier             = var.storage_tier
  # account replication types LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
  account_replication_type = var.storage_replication_type
}
