output "gateways" {
  value = [
    for n in var.gateways : {
      name = n.name
      ip   = split("/", n.ip_wan)[0]
    }
  ]
}
