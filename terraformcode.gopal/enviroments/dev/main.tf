module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg_v   = var.rg_v
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  depends_on = [module.resource_group]
  public_ip = var.public_ip

}
module "vnet" {
  source     = "../../modules/azurerm_vnet"
  depends_on = [module.resource_group]
  vnet       = var.vnet
}

module "subnet" {
  source     = "../../modules/azurerm_subnet"
  depends_on = [module.vnet]
  subnet     = var.subnet
}


module "nic" {
  source     = "../../modules/Nic"
  depends_on = [module.resource_group, module.vnet, module.subnet,module.public_ip]
  nic        = var.nic
}

module "vm_linux" {
  source      = "../../modules/azurerm_vm"
  depends_on  = [module.nic]
 
  frontend_vm =var.frontend_vm
   }