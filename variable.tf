variable "hcloud_token" {
  description = "OAuth-token, you can get him -> https://console.hetzner.cloud/projects/<your_project_id>/security/tokens"
  sensitive = true
}

variable "hostname" {
  description = "All hostname for server"
  type        = set(string)
  default     = ["web", "router", "db", "manage"]
}

variable "net" {
  default  = {
        management = {
		net = "10.10.0.0/16"
		subnet = "10.10.0.0/24"
	}
        intranet-1 = {
		net = "10.100.0.0/16"
		subnet = "10.100.0.0/24"
	}
	intranet-2 = {
		net = "10.200.0.0/16"
		subnet = "10.200.0.0/24"
	}
  }
}
