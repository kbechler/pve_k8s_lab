provider "proxmox" {
  tmp_dir = "/var/tmp"
  ssh {
    agent    = true
    username = "root"
  }
}

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.95.0"
    }
  }
  required_version = ">= 1.8.8"
}
