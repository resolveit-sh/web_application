resource "yandex_compute_instance" "vm-1" {
  name                      = var.vm_name
  platform_id               = var.platform_id
  zone                      = var.network_zone
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = file("./modules/tf-yc-instance/scripts/users.yaml")
  }
}
