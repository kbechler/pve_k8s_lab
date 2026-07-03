variable "gateways" {
  default = [
    {
      name   = "gateway01"
      id     = 9001
      ip     = "192.168.0.1/24"
      ip_wan = "10.80.80.211/24"
      node   = "node01"
    },
    {
      name   = "gateway02"
      id     = 9002
      ip     = "192.168.0.2/24"
      ip_wan = "10.80.80.212/24"
      node   = "node02"
    },
    {
      name   = "gateway03"
      id     = 9003
      ip     = "192.168.0.3/24"
      ip_wan = "10.80.80.213/24"
      node   = "node03"
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
  default = 2048
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "bridge" {
  type    = string
  default = "lab1"
}

variable "bridge_wan" {
  type    = string
  default = "vmbr0"
}

variable "gw" {
  type    = string
  default = "10.80.80.1"
}
