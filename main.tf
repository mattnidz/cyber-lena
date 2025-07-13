provider "azurerm" {
  subscription_id = var.subscription_id[var.environment]
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name[var.environment]
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  name                = var.app_service_plan_name[var.environment]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = false

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_linux_web_app" "app" {
  name                = var.web_app_name[var.environment]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_app_service_plan.plan.id

  site_config {
    application_stack {
      node_version = "22-lts"
    }
  }
}