data "azurerm_public_ip" "p_ip" {
  for_each = var.nic
  name = each.value.pip_name
  resource_group_name = each.value.rg_name
}
data "azurerm_virtual_network" "dat_vnet" {
  for_each = var.nic
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "nic_subnet" {
  for_each             = var.nic
  name                 = each.value.subnet_name
 virtual_network_name = data.azurerm_virtual_network.dat_vnet[each.key].name
  resource_group_name  = each.value.rg_name
}
resource "azurerm_network_interface" "nic_b" {
      for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration.ipconfig_name
    subnet_id                     = data.azurerm_subnet.nic_subnet[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.p_ip[each.key].id
  }
}
