output "ip_address_local" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "ip_address_global" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}