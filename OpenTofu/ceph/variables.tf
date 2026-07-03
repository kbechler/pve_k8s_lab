variable "ceph_nodes" {
  default = [
    {
      name = "ceph01"
      id   = 9011
      ip   = "192.168.0.11/24"
      node = "node01"
    },
    {
      name = "ceph02"
      id   = 9012
      ip   = "192.168.0.12/24"
      node = "node02"
    },
    {
      name = "ceph03"
      id   = 9013
      ip   = "192.168.0.13/24"
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

variable "system_disk_size" {
  type    = number
  default = 40
}

variable "data_disk_size" {
  type    = number
  default = 80
}

variable "bridge" {
  type    = string
  default = "lab1"
}

variable "gw" {
  type    = string
  default = "192.168.0.4"
}
