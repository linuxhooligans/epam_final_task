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
  ip_range = "10.10.0.0/16"
}
resource "hcloud_network_subnet" "network-subnet-management" {
  type         = "cloud"
  network_id   = hcloud_network.network-management.id
  network_zone = "eu-central"
  ip_range     = "10.10.0.0/24"
}

resource "hcloud_network" "network-intranet-1" {
  name     = "intranet-1"
  ip_range = "10.100.0.0/16"
}
resource "hcloud_network_subnet" "network-subnet-intranet-1" {
  type         = "cloud"
  network_id   = hcloud_network.network-intranet-1.id
  network_zone = "eu-central"
  ip_range     = "10.100.0.0/24"
}

resource "hcloud_network" "network-intranet-2" {
  name     = "intranet-2"
  ip_range = "10.200.0.0/16"
}
resource "hcloud_network_subnet" "network-subnet-intranet-2" {
  type         = "cloud"
  network_id   = hcloud_network.network-intranet-2.id
  network_zone = "eu-central"
  ip_range     = "10.200.0.0/24"
}

# resource "hcloud_server" "node" {
#   count       = 3
#   name        = "node${count.index + 1}"
#   image       = "centos-7"
#   server_type = "cx11"
# }

resource "hcloud_server" "node" {
  for_each    = var.hostname
  name        = each.value
  image       = "centos-7"
  server_type = "cx11"
}

# resource "hcloud_server_network" "network-management" {
#   count       = 3
#   server_id  = hcloud_server.node[count.index].id
#   network_id = hcloud_network.network-management.id
#   ip         = "10.10.0.${count.index + 10}"
# }
# resource "hcloud_server_network" "network-intranet-1" {
#   count       = 3
#   server_id  = hcloud_server.node[count.index].id
#   network_id = hcloud_network.network-intranet-1.id
#   ip         = "10.100.0.${count.index + 10}"
# }
# resource "hcloud_server_network" "network-intranet-2" {
#   count       = 3
#   server_id  = hcloud_server.node[count.index].id
#   network_id = hcloud_network.network-intranet-2.id
#   ip         = "10.200.0.${count.index + 10}"
# }
