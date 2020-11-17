# [2.0.0](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.2.1...v2.0.0) (2019-08-08)


### Bug Fixes

* `sku` has been deprecated in favour of the `sku_name` ([60fab7f](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/60fab7f))
* set provider version constraints ([3ec3cc1](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/3ec3cc1))
* setting access policies now works as expected ([9ebf424](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/9ebf424))


### Features

* `secrets` is now a `map` of strings instead of `list` of objects. ([f956f55](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/f956f55))
* output the `name` property ([414af3a](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/414af3a))
* use `for_each` to iterate over `secrets` ([e044427](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/e044427))


### BREAKING CHANGES

* `secrets` argument is now type `map` instead of `list` of objects, where the key is the name of the secret.

## [1.2.1](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.2.0...v1.2.1) (2019-07-10)


### Bug Fixes

* **outputs:** changed `uri` to return `vault_uri` instead of `id` ([#8](https://github.com/innovationnorway/terraform-azurerm-key-vault/issues/8)) ([0e8e0d4](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/0e8e0d4))

# [1.2.0](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.1.2...v1.2.0) (2019-07-03)


### Features

* self-assign permissions if logged in as service principal ([9039c59](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/9039c59))

## [1.1.2](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.1.1...v1.1.2) (2019-06-15)

## [1.1.1](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.1.0...v1.1.1) (2019-05-08)


### Bug Fixes

* make adjustments after v0.12.0-rc1 release ([0f22ec4](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/0f22ec4))

# [1.1.0](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.0.1...v1.1.0) (2019-04-24)


### Features

* add `id` and `uri` outputs ([cf314db](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/cf314db))
* add `references` and `secrets` outputs ([0345988](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/0345988))

## [1.0.1](https://github.com/innovationnorway/terraform-azurerm-key-vault/compare/v1.0.0...v1.0.1) (2019-04-24)


### Bug Fixes

* explicitly create dependency for secrets ([f79f973](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/f79f973))

# 1.0.0 (2019-04-23)


### Features

* initial release ([7c113bf](https://github.com/innovationnorway/terraform-azurerm-key-vault/commit/7c113bf))
