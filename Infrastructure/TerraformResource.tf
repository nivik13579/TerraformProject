resource "azurerm_resource_group" "TestNKTerraform" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"
}

resource "azurerm_app_service_plan" "TestNKTerraform" {
  name                = "${var.appserviceplanname}"
  location            = "${azurerm_resource_group.TestNKTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestNKTerraform.name}"
  kind                = "${var.appserviceplankind}"
  reserved	      = "true"
  sku {
    tier = "${var.skutier}"
    size = "${var.skusize}"
  }
}

resource "azurerm_app_service" "TestNKTerraform" {
  name                = "${var.appservicename}"
  location            = "${azurerm_resource_group.TestNKTerraform.location}"
  resource_group_name = "${azurerm_resource_group.TestNKTerraform.name}"
  app_service_plan_id = "${azurerm_app_service_plan.TestNKTerraform.id}"
  site_config {
    java_version           = "${var.appsvcjavaversion}"
	always_on = "${var.appservicealwayson}"
  }
}