terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform_state_resource_group"
    storage_account_name = "tfstatesa20230216"
    container_name       = "terraformstatesc"
    key                  = "azure-project/terraform.state"
  }
}

provider "azurerm" {
  features {}
}
