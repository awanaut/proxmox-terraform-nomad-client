resource "proxmox_virtual_environment_vm" "nomadclient" {
  name      = "prod-nomad-client-${count.index}"
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
  }
}
