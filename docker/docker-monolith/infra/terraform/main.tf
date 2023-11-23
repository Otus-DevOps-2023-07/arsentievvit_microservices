provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "docker" {
  count = var.instance_count
  name  = "docker-${count.index}"
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }
  network_interface {
    nat       = true
    subnet_id = var.subnet_id
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = "10"
      type     = "network-hdd"
    }
  }
}
