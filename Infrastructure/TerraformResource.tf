resource "azurerm_resource_group" "TestNKTerraform" {
  name     = "TestNKTerraformRG"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "TestNKTerraform" {
  name                = "TestNKTerraformappserviceplan"
  location            = "${azurerm_resource_group.TestNKTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestNKTerraform.name}"
  kind                = "Linux"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "TestNKTerraform" {
  name                = "TestNKTerraformappservice"
  location            = "${azurerm_resource_group.TestNKTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestNKTerraform.name}"
  app_service_plan_id = "${azurerm_app_service_plan.TestNKTerraform.id}"
  site_config {
    java_version           = "1.8"
  }
}