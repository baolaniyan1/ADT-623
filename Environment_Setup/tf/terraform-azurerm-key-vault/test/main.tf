variable "location" {
  default = "westeurope"
}

resource "random_id" "test" {
  byte_length = 4
}

resource "azurerm_resource_group" "test" {
  name     = format("test-%s", random_id.test.hex)
  location = var.location
}

module "key_vault" {
  source = "../"

  name = format("test-%s", random_id.test.hex)

  resource_group_name = azurerm_resource_group.test.name

  access_policies = [
    {
      group_names        = ["terraform-acceptance-testing"]
      secret_permissions = ["get"]
    }
  ]

  secrets = {
    "message" = "Hello, world!"
  }
}

data "azurerm_key_vault" "test" {
  name = module.key_vault.name

  resource_group_name = azurerm_resource_group.test.name
}

module "test_assertions" {
  source = "innovationnorway/assertions/test"
  equals = [
    {
      name = "has access policies"
      got  = length(data.azurerm_key_vault.test.access_policy)
      want = 2
    }
  ]
}
