variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable db_port {
  description = "Database port"
  default     = "27017"
}

variable network {
  description = "Network interface"
  default     = "default"
}
