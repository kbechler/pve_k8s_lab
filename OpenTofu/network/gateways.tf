resource "proxmox_virtual_environment_vm" "gateways" {
  count     = length(var.gateways)
  name      = var.gateways[count.index].name
  node_name = var.gateways[count.index].node
  vm_id     = var.gateways[count.index].id

  startup {
    order      = "1"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = var.core_count
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory_size
    floating  = var.memory_size
  }

  disk {
    datastore_id = var.datastore
    file_id      = var.image_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  network_device {
    model  = "virtio"
    bridge = var.bridge_wan
  }

  network_device {
    model  = "virtio"
    bridge = var.bridge
  }


  agent {
    enabled = true
    timeout = "30s"
  }
  stop_on_destroy = true

  lifecycle {
    ignore_changes = [
      node_name,
      #   initialization
    ]
  }

  # serial device is required for debian12 to boot properly
  serial_device {}

  initialization {
    datastore_id = var.datastore
    upgrade      = false

    ip_config {
      ipv4 {
        address = var.gateways[count.index].ip_wan
        gateway = var.gw
      }
    }

    ip_config {
      ipv4 {
        address = var.gateways[count.index].ip
      }
    }

    user_account {
      username = "ubuntu"
      keys     = var.ssh_keys
      password = random_string.root-password.result
    }
  }
}

resource "random_string" "root-password" {
  length  = 20
  special = false
}
