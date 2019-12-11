

# Variable Declaration for Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default =  "RG_"
}


# Variable Declaration for Location
variable "region" {
  description = "The location/region where resources is created. Changing this forces a new resource to be created."
  default = "UK South"
}
variable "appserviceplanname" {
description = "App service Plan Name"
  }
# Varaible declaration for 
variable "appserviceplankind" {
description = "Linux/Windows"
  default = "Windows"
}
# Variable Declaration for 
variable "skutier" {
    description = "The value for the skutier"
    
}


# Variable Declaration for
variable "skusize" {
    description = "SKU size"
  
}

variable "appservicename" {
    description = "App Service Name"
  
}

# Variable Declaration for
variable "appsvcjavaversion" {
    description = "Java version"
  
}

# Variable Declaration for
variable "appservicealwayson" {
    description = "Set Always On for App Service"
  
}
