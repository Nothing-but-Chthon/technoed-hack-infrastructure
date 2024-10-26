terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.129.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = "../authorized_key.json"
  cloud_id           = var.cloud_id
  folder_id          = var.folder_id
  zone               = var.zone
}

resource "yandex_compute_instance" "hackathon" {
  name        = "hackathon-vm"
  platform_id = "standard-v2"
  zone        = var.zone

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    disk_id = yandex_compute_disk.hackathon.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.hackathon.id
    nat       = true
  }

  metadata = {
    "ssh-keys" = "ebob:${file("/Users/ebob/.ssh/id_rsa.pub")}"
  }

}

resource "yandex_compute_disk" "hackathon" {
  name   = "hackathon-disk"
  zone   = var.zone
  size   = 20
  type   = "network-hdd"
  image_id = var.image_id
}

resource "yandex_vpc_network" "hackathon" {
  name = "hackathon-network"
}

resource "yandex_vpc_subnet" "hackathon" {
  name           = "hackathon-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.hackathon.id
  v4_cidr_blocks = ["192.168.1.0/24"]
}
