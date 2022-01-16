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

resource "hcloud_server" "node" {
  count       = 3
  name        = "node${count.index}"
  image       = "centos-7"
  server_type = "cx11"
}
