variable "public_ip" {
  type = map(object({
    pip_name                    = string
    rg_name     = string
    location                = string
    allocation_method       = string
    sku                     = string
    idle_timeout_in_minutes = string
  }))
}
