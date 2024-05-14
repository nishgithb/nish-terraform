terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {} #this is optional. Not a terraform variable
  }
# provider "aws" { #for multicloud tenancy
  
# }
