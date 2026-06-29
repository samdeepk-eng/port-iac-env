variable "port_client_id" {
  description = "Port client ID"
  type        = string
  sensitive   = true
}

variable "port_client_secret" {
  description = "Port client secret"
  type        = string
  sensitive   = true
}

variable "port_base_url" {
  description = "Port API base URL"
  type        = string
  default     = "https://api.getport.io"
}
