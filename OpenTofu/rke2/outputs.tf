output "masters" {
  value = [
    for n in var.masters : {
      name = n.name
      ip   = split("/", n.ip)[0]
    }
  ]
}

output "workers" {
  value = [
    for n in var.workers : {
      name = n.name
      ip   = split("/", n.ip)[0]
    }
  ]
}
