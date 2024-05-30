terraform {
  required_providers {
    // Uncomment as soon as I create an Azure account
    /*azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }*/
    aws = {
      source = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}

// Uncomment as soon as I create an Azure account
/*provider "azurerm" {
  features {}
}*/

provider "aws" {}



# 1. for_each for resource
// Uncomment as soon as I create an Azure account
/*resource "azurerm_resource_group" "rg" {
  // Create several resource's instances
  for_each = tomap({
    a_group       = "eastus"
    another_group = "westus2"
  })
  name     = each.key
  location = each.value
}*/

resource "aws_iam_user" "the-accounts" {
  // Create several resource's instances
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}
