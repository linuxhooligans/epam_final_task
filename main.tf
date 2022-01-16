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
  name        = "node1"
  image       = "debian-9"
  server_type = "cx11"
}
