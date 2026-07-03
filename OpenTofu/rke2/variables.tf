variable "masters" {
  default = [
    {
      name = "master01"
      id   = 9021
      ip   = "192.168.0.21/24"
      node = "node01"
    },
    {
      name = "master02"
      id   = 9022
      ip   = "192.168.0.22/24"
      node = "node02"
    },
    {
      name = "master03"
      id   = 9023
      ip   = "192.168.0.23/24"
      node = "node03"
    }
  ]
}

variable "workers" {
  default = [
    {
      name = "worker01"
      id   = 9031
      ip   = "192.168.0.31/24"
      node = "node01"
    },
    {
      name = "worker02"
      id   = 9032
      ip   = "192.168.0.32/24"
      node = "node02"
    },
    {
      name = "worker03"
      id   = 9033
      ip   = "192.168.0.33/24"
      node = "node03"
    }
  ]
}

variable "ssh_keys" {
  type        = list(any)
  description = "List of SSH keys to install on all VMs (using cloud-init). Set via TF_VAR_ssh_keys in env.sh."
}

variable "cpu_type" {
  type        = string
  description = "The emulated CPU type"
  default     = "x86-64-v2-AES"
}

variable "datastore" {
  type        = string
  description = "Default datastore"
  default     = "data"
}

variable "image_id" {
  type    = string
  default = "data:iso/noble-server-cloudimg-amd64.img"
}

variable "core_count" {
  type    = number
  default = 2
}

variable "memory_size" {
  type    = number
  default = 4096
}

variable "disk_size" {
  type    = number
  default = 40
}

variable "bridge" {
  type    = string
  default = "lab1"
}

variable "gw" {
  type    = string
  default = "192.168.0.4"
}
