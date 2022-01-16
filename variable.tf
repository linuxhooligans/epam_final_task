variable "hcloud_token" {
  description = "OAuth-token, you can get him -> https://console.hetzner.cloud/projects/<your_project_id>/security/tokens"
  sensitive = true
}

variable "hostname" {
  description = "All hostname for server"
  type        = set(string)
  default     = ["web", "router", "db", "manage"]
}
