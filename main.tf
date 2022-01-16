terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.32.2"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_network" "network" {
  name     = "management"
  ip_range = "10.10.0.0/16"
}

resource "hcloud_network_subnet" "network-subnet-management" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = "10.10.10.0/24"
}
resource "hcloud_network_subnet" "network-subnet-intranet-1" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = "10.10.100.0/24"
}
resource "hcloud_network_subnet" "network-subnet-intranet-2" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = "10.10.200.0/24"
}


resource "hcloud_server" "node" {
  count       = 3
  name        = "node${count.index + 1}"
  image       = "centos-7"
  server_type = "cx11"
  network {
    network_id = hcloud_network.network.id
    ip         = "10.10.10.${count.index + 1}"
  }
  depends_on = [
    hcloud_network_subnet.network-subnet-management
  ]
}
