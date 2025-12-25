# =========================
# Resource Groups
# =========================
rg_v = {
  rg1 = {
    rg_name  = "rg-dev"
    location = "centralindia"
  }

  rg2 = {
    rg_name  = "rg-prod"
    location = "centralindia"
  }
}

# =========================
# Virtual Networks
# =========================
vnet = {
  vnet1 = {
    vnet_name      = "vnet-dev"
    rg_name        = "rg-dev"
    location       = "centralindia"
    address_space  = ["10.0.0.0/16"]
  }

  vnet2 = {
    vnet_name      = "vnet-prod"
    rg_name        = "rg-prod"
    location       = "centralindia"
    address_space  = ["10.1.0.0/16"]
  }
}

# =========================
# Subnets
# =========================
subnet = {
  subnet1 = {
    subnet_name       = "subnet1"
    rg_name           = "rg-dev"
    vnet_name         = "vnet-dev"
    address_prefixes  = ["10.0.1.0/24"]
  }

  subnet2 = {
    subnet_name       = "subnet2"
    rg_name           = "rg-prod"
    vnet_name         = "vnet-prod"
    address_prefixes  = ["10.1.1.0/24"]
  }
}

# =========================
# Public IPs
# =========================
public_ip = {
  pip1 = {
    pip_name                  = "pip-vm1"
    rg_name                   = "rg-dev"
    location                  = "centralindia"
    allocation_method         = "Static"
    sku                       = "Standard"
    idle_timeout_in_minutes   = 4
  }

  pip2 = {
    pip_name                  = "pip-vm2"
    rg_name                   = "rg-prod"
    location                  = "centralindia"
    allocation_method         = "Static"
    sku                       = "Standard"
    idle_timeout_in_minutes   = 10
  }
}

# =========================
# Network Interfaces
# =========================
nic = {
  nic1 = {
    nic_name     = "nic-vm1"
    location     = "centralindia"
    rg_name      = "rg-dev"
    subnet_name  = "subnet1"
    pip_name     = "pip-vm1"
    vnet_name    = "vnet-dev"

    ip_configuration = {
      ipconfig_name                 = "ipconfig1"
      private_ip_address_allocation = "Dynamic"
    }
  }

  nic2 = {
    nic_name     = "nic-vm2"
    location     = "centralindia"
    rg_name      = "rg-prod"
    subnet_name  = "subnet2"
    pip_name     = "pip-vm2"
    vnet_name    = "vnet-prod"

    ip_configuration = {
      ipconfig_name                 = "ipconfig2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

# =========================
# Frontend Virtual Machines
# =========================
frontend_vm = {
  vm1 = {
    vm_name     = "frontend-vm1"
    nic_name    = "nic-vm1"
    location    = "centralindia"
    rg_name     = "rg-dev"

    # SAFE & AVAILABLE
    size        = "Standard_D2s_v3"

    user_name  = "adminuser"
    pswd_name  = "Admin@12345678"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }

  vm2 = {
    vm_name     = "frontend-vm2"
    nic_name    = "nic-vm2"
    location    = "centralindia"
    rg_name     = "rg-prod"

    # SAME SKU = no capacity fight
    size        = "Standard_D2s_v3"

    user_name  = "adminuser"
    pswd_name  = "Admin@12345678"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
}
