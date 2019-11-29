resource "azurerm_resource_group" "TFResource20192" {
  name     = "TFResource2019RG2"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "TFResource20192" {
  name                = "TFResource2019appserviceplan2"
  location            = "${azurerm_resource_group.2TFResource2019.location}"
  resource_group_name = "${azurerm_resource_group.2TFResource2019.name}"
  kind                = "Linux"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "TFResource20192" {
  name                = "TFResource2019appservice2"
  location            = "${azurerm_resource_group.2TFResource2019.location}"
  resource_group_name = "${azurerm_resource_group.2TFResource2019.name}"
  app_service_plan_id = "${azurerm_app_service_plan.TFResource2019.id}"
  site_config {
    java_version           = "1.8"
  }
}