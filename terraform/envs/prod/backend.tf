terraform {
  backend "azurerm" {
    resource_group_name  = "Default"
    storage_account_name = "tfstatemattpoc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}