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

resource "hcloud_server" "node1" {
  count       = 3
  name        = "node${count.index}"
  image       = "debian-10"
  server_type = "cx11"
}
