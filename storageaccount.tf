resource "azurerm_storage_account" "mcstorage102023" {
  location                 = azurerm_resource_group.rg.location
  name                     = "mcstorage102023"
  resource_group_name      = azurerm_resource_group.rg.name
  account_replication_type = "GRS"
  account_tier             = "Standard"
}
