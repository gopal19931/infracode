 data "azurerm_network_interface" "nic_d" {
    for_each = var.frontend_vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_linux_virtual_machine" "frontend" {
    for_each = var.frontend_vm
    name     = each.value.vm_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    size             = each.value.size
    # admin_username = data.azurerm_key_vault_secret.sec_user[each.key].value #each.value.admin_username
    # admin_password = data.azurerm_key_vault_secret.sec_pswd[each.key].value #each.value.admin_password

    network_interface_ids = [data.azurerm_network_interface.nic_d[each.key].id]
    admin_username=each.value.user_name
    admin_password=each.value.pswd_name
    disable_password_authentication = false
   
    os_disk {
        caching = each.value.os_disk.caching
        storage_account_type = each.value.os_disk.storage_account_type
# caching              = lookup(each.value.os_disk, "caching", "ReadWrite")
# storage_account_type = lookup(each.value.os_disk, "storage_account_type", "Standard_LRS")
        # disk_size_gb         = lookup(each.value.os_disk, "disk_size_gb", 30)   # <-- add disk size
    }
    source_image_reference {
    
        publisher = each.value.source_image_reference.publisher
        offer = each.value.source_image_reference.offer
        sku  = each.value.source_image_reference.sku
        version = each.value.source_image_reference.version
    }
}