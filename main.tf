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

resource "hcloud_network" "network-management" {
  name     = "management"
  ip_range = "10.10.10.0/24"
}
resource "hcloud_network" "network-intranet-1" {
  name     = "intranet-1"
  ip_range = "10.100.0.0/24"
}
resource "hcloud_network" "network-intranet-2" {
  name     = "intranet-2"
  ip_range = "10.200.0.0/24"
}


resource "hcloud_server" "node" {
  count       = 3
  name        = "node${count.index}"
  image       = "centos-7"
  server_type = "cx11"
}
