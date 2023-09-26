variable "endpoint" {
  type        = string
  default     = null
  description = "Proxmox API endpoint for the provider. Ex. https://192.168.1.200:8006"
}

variable "proxmox_api_user" {
  type        = string
  default     = "root@pam"
  description = "Username for API auth"
}

variable "proxmox_api_password" {
  type        = string
  default     = "somepassword"
  description = "Password for API auth"
}

variable "ssh_password" {
  type        = string
  default     = "somepassword"
  description = "Password for API auth"
}

variable "instance_count" {
  type        = number
  default     = 3
  description = "Number of nomad client instances to create"
}

variable "cores" {
  type        = number
  default     = 1
  description = "Number of cores of the LXC containers"
}

variable "sockets" {
  type        = number
  default     = 1
  description = "Number of CPU sockets"
}

variable "memory" {
  type        = number
  default     = 2048
  description = "Memory in MiB of the LXC containers"
}

variable "datastore" {
  type        = string
  default     = "local-lvm"
  description = "Datastore of where to store the disk"
}

variable "disk_size" {
  type        = number
  default     = 12
  description = "Size of the root filesystem"
}

variable "proxmox_node" {
  type        = string
  default     = "proxmox"
  description = "Proxmox node name to deploy to"
}

variable "vm_id" {
  type        = string
  default     = 9999
  description = "VM id of the template"
}
variable "nomad_url" {
  type = string
}
