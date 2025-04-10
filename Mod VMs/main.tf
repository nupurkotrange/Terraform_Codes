provider "azurerm" {
  subscription_id = "6912d7a0-bc28-459a-9407-33bbba641c07"
  tenant_id       = "70c0f6d9-7f3b-4425-a6b6-09b47643ec58"
  features {}
}

locals {
  resource_group="app-grp"
  location="North Europe"
}


resource "azurerm_resource_group" "app_grp"{
  name=local.resource_group
  location=local.location
}