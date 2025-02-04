output "subnet_id" {
  value = data.yandex_vpc_subnet.default.id
}

output "network_zone" {
  value = var.network_zone
}
