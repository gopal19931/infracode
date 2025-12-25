resource "azurerm_resource_group" "rg_vtms" {
    for_each = var.rg_v
  #     for_each = {   
  #   rg1 = "East US"
  #   rg2 = "West Europe"
  #   rg3 = "Central US"
  # }
  # name     = each.key
  # location = each.value

  name     = each.value.rg_name
  location = each.value.location
}