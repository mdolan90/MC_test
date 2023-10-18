provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.appservicename
}

resource "azurerm_app_service_plan" "appsp" {
  location            = azurerm_resource_group.rg.location
  name                = "mcappserviceplan"
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    size = "S1"
    tier = "Standard"
  }
}

resource "azurerm_app_service" "appservice" {
  app_service_plan_id = azurerm_app_service_plan.appsp.id
  location            = azurerm_resource_group.rg.location
  name                = "mcassignment"
  resource_group_name = azurerm_resource_group.rg.name

  site_config {
    python_version           = "3.4"
    remote_debugging_enabled = true
  }
}
