data "http" "nomad" {
  url = var.nomad_url
  request_headers = {
    Accept = "application/json"
  }
}
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
  insecure = true
  endpoint = var.endpoint
  username = var.proxmox_api_user
  password = var.proxmox_api_password
}



resource "proxmox_virtual_environment_vm" "nomadclient" {
  name      = "nomad-client-${count.index}"
  count     = var.instance_count
  node_name = var.proxmox_node
  on_boot   = true
  started   = true

  operating_system {
    type = "l26"
  }

  agent {
    enabled = true
  }

  clone {
    vm_id = 9999
  }

  cpu {
    cores   = var.cores
    sockets = var.sockets
  }

  disk {
    datastore_id = var.datastore
    interface    = "virtio0"
    file_format  = "raw"
  }

  memory {
    dedicated = var.memory
  }
  lifecycle {
    create_before_destroy = true
    postcondition {
      condition     = contains([200], data.http.nomad.status_code)
      error_message = "Status code invalid"
    }
  }
}
