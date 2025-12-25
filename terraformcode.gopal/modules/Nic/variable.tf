variable "nic" {
  type = map(object({
    nic_name                = string
    location            = string
    rg_name = string
    vnet_name          = string
    pip_name = string
    subnet_name       = string
    ip_configuration = object({
      ipconfig_name                 = string
      private_ip_address_allocation = string
  })
    }
    )
  )
}
  