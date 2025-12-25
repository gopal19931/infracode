variable "rg_v" {
  type = map(object({
    rg_name     = string
    location = string
  }))
}
variable "vnet" {
  type = map(object({
    vnet_name                = string
    rg_name = string
    location            = string
    address_space       = list(string)
    })
  )
}
variable "subnet" {
  type = map(object({
    subnet_name                 = string
    rg_name  = string
    vnet_name = string
    address_prefixes     = list(string)
    })
  )
}
variable "public_ip" {
  type = map(object({
    pip_name                = string
    rg_name     = string
    location                = string
    allocation_method       = string
    sku                     = string
    idle_timeout_in_minutes = string
  }))
}
variable "nic" {
  type = map(object({
    nic_name                = string
    location            = string
    rg_name = string
    subnet_name = string
       pip_name = string
    vnet_name          = string

    ip_configuration = object({
      ipconfig_name                 = string
      # subnet_id                     = string
      private_ip_address_allocation = string
      # public_ip_address_id          = each.value.ip_configuration.public_ip_add = 
    })
    }
    )
  )
}
variable "frontend_vm" {
  type = map(object({
    vm_name                = string
    nic_name            = string
    location            = string
    rg_name = string
    size                = string
    user_name           = string
    pswd_name           = string

    # admin_username = string
    # admin_password = string
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      sku       = string
      offer     = string
      version   = string

    })
  }))
}