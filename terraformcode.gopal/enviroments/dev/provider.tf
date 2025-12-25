terraform {
  required_version = "1.14.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"

    }
  }
  backend "azurerm" {
        resource_group_name="demorg"
        storage_account_name="storageaccount"
        container_name="test121"
        key="terraform.tfstate"
    }

}
  
    
provider "azurerm" {
  features {}
  subscription_id = "02e2bf71-710c-4170-b8d6-c0cf2ca7551b"

}
