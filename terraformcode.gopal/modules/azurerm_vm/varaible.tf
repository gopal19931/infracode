variable "frontend_vm" {
  type = map(object({
        vm_name = string
        nic_name = string
        location = string
        rg_name = string
        size = string
        user_name =  string
        pswd_name = string
    
        # admin_username = string
        # admin_password = string
        os_disk = object({
            caching = string
            storage_account_type = string
        })
        source_image_reference = object({
            publisher = string
            sku = string
            offer = string
            version = string
            
        })
    }))
}