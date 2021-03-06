provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "production"
  location = "West US"
}

resource "azurerm_storage_account" "aml" {
  name                     = "st${var.prefix}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_application_insights" "example" {
  name                = "workspace-example-ai"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}

resource "azurerm_key_vault" "aml" {
  name                     = "kv-${var.prefix}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id

  sku_name = "standard"

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}


resource "azurerm_application_insights" "aml" {
  name                     = "appinsights-${var.prefix}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  application_type    = "web"
}

resource "azurerm_container_registry" "aml" {
  name                     = "acr${var.prefix}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = true

  resource "azurerm_template_deployment" "aml" {
  name                     = "aml-${var.prefix}-deploy"
  resource_group_name = var.resource_group_name

  template_body = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "location": {
      "type": "string"
    },
    "amlWorkspaceName": {
      "type": "string"
    },
    "storageAccount": {
      "type": "string"
    },
    "keyVault": {
      "type": "string"
    },
    "applicationInsights": {
      "type": "string"
    },
    "containerRegistry": {
      "type": "string"
    }
  },
  "resources": [
    {
      "type": "Microsoft.MachineLearningServices/workspaces",
      "apiVersion": "2018-11-19",
      "name": "[parameters('amlWorkspaceName')]",
      "location": "[parameters('location')]",
      "identity": {
        "type": "systemAssigned"
      },
      "properties": {
        "friendlyName": "[parameters('amlWorkspaceName')]",
        "keyVault": "[parameters('keyVault')]",
        "applicationInsights": "[parameters('applicationInsights')]",
        "containerRegistry": "[parameters('containerRegistry')]",
        "storageAccount": "[parameters('storageAccount')]"
      }
    }
  ],
  "outputs": {
    "id": {
      "type": "string",
      "value": "[resourceId('Microsoft.MachineLearningServices/workspaces', parameters('amlWorkspaceName'))]"
    },
    "name": {
      "type": "string",
      "value": "[parameters('amlWorkspaceName')]"
    }
  }
}
DEPLOY

  parameters = {
    location = var.location
    amlWorkspaceName = "aml-${var.prefix}"
    storageAccount = azurerm_storage_account.aml.id
    keyVault = azurerm_key_vault.aml.id
    applicationInsights = azurerm_application_insights.aml.id
    containerRegistry = azurerm_container_registry.aml.id
  }

  deployment_mode = "Incremental"
}