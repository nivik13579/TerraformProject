resource "azurerm_resource_group" "TestTerraform" {
  name     = "TFResource20192RG"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "TestTerraform" {
  name                = "TFResource20192appserviceplan"
  location            = "${azurerm_resource_group.TestTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestTerraform.name}"
  kind                = "Linux"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "TestTerraform" {
  name                = "TFResource20192appservice"
  location            = "${azurerm_resource_group.TestTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestTerraform.name}"
  app_service_plan_id = "${azurerm_app_service_plan.TestTerraform.id}"
  site_config {
    java_version           = "1.8"
  }
}