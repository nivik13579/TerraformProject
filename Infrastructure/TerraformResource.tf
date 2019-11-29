resource "azurerm_resource_group" "TFResource2019" {
  name     = "TFResource2019RG"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "TFResource2019" {
  name                = "TFResource2019appserviceplan"
  location            = "${azurerm_resource_group.TFResource2019.location}"
  resource_group_name = "${azurerm_resource_group.TFResource2019.name}"
  kind                = "Linux"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "TFResource2019" {
  name                = "TFResource2019appservice"
  location            = "${azurerm_resource_group.TFResource2019.location}"
  resource_group_name = "${azurerm_resource_group.TFResource2019.name}"
  app_service_plan_id = "${azurerm_app_service_plan.TFResource2019.id}"
  site_config {
    java_version           = "1.8"
  }
}