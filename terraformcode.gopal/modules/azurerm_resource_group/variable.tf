variable "rg_v" {
  type = map(object({
    rg_name     = string
    location = string
  }))
}