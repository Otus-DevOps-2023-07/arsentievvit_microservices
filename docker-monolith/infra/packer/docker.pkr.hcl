variable "yc_service_account_key_file" {
    type = string
    description = "My service access file"
    default =  null
}

variable "yc_subnet_id" {
    type = string
    description = "Virtual private network ID"
    default = null
}

variable "yc_folder_id" {
    type = string
    description = "Default folder in which operation go"
    default = null
}

variable "yc_ssh_username" {
    type = string
    description = "Default SSH username"
    default = "ubuntu"
}


source "yandex" "docker" {
  service_account_key_file  = "${var.yc_service_account_key_file}"
  folder_id                 = "${var.yc_folder_id}"
  source_image_family       = "ubuntu-2204-lts"
  image_name                = "docker-base-${formatdate("DD-MM-YYYY-HH-MM", timestamp())}"
  image_family              = "docker-base"
  ssh_username              = "${var.yc_ssh_username}"
  use_ipv4_nat              = "true"
  platform_id               = "standard-v1"
  subnet_id                 = "${var.yc_subnet_id}"
  disk_type                 = "network-hdd"
  disk_size_gb              = "10"
}

build {
  sources = ["source.yandex.docker"]

  provisioner "shell" {
    name            = "docker"
    inline	    = [
      "sleep 30",
      "sudo apt update",
      "sleep 60",
      "sudo apt install -y apt-transport-https ca-certificates",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt update",
      "sudo apt install -y docker-ce",
      "sudo usermod -aG docker ubuntu"
    ]
  }
}
