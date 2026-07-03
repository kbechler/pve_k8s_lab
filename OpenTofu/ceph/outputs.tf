output "ceph_nodes" {
  value = [
    for n in var.ceph_nodes : {
      name = n.name
      ip   = split("/", n.ip)[0]
    }
  ]
}
