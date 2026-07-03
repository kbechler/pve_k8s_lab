resource "proxmox_virtual_environment_vm" "workers" {
  count     = length(var.workers)
  name      = var.workers[count.index].name
  node_name = var.workers[count.index].node
  vm_id     = var.workers[count.index].id

  startup {
    order      = "3"
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
        address = var.workers[count.index].ip
        gateway = var.gw
      }
    }

    user_account {
      username = "ubuntu"
      keys     = var.ssh_keys
      password = random_string.worker-root-password.result
    }
  }
}

resource "random_string" "worker-root-password" {
  length  = 20
  special = false
}
