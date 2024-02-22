terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.32.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}

provider "proxmox" {
  insecure = var.insecure
  endpoint = var.endpoint
  username = var.proxmox_api_user
  password = var.proxmox_api_password
}
