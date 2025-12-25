resource "azurerm_public_ip" "pip_b" {
  for_each = var.public_ip
  name                    = each.value.pip_name
  location                = each.value.location
  resource_group_name     = each.value.rg_name
  allocation_method       = each.value.allocation_method 
  sku                     = each.value.sku #Public IP Standard SKUs require allocation_method to be set to Static.
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  # Ek hi Public IP ko aap NIC aur Load Balancer dono ke saath attach nahi kar sakte. 
  # Azure me public IP is SINGLE BINDING: Either to NIC Or to Load Balancer
#   tags = {
#     environment = each.value.tags.environment
#   }
}