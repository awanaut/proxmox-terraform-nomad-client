# Terraform Nomad Client Deployment on Proxmox

Terraform module to perform a rolling deployment of Nomad Clients on Proxmox from a template. This works in conjuction with my [Packer template](https://github.com/awanaut/proxmox-nomad-packer-template).

## Table of Contents

<!-- TOC -->
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
  * [Variables](#variables)
<!-- TOC -->

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform) 1.5.x+
- Template available to deploy from. Use my [Packer template](https://github.com/awanaut/proxmox-nomad-packer-template) to make this easy.


## Usage
1. ```git clone https://github.com/awanaut/proxmox-terraform-nomad-client && cd proxmox-terraform-nomad-client```

2. Create `terraform.tfvars` and fill out [variables](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files)
3. `terraform plan` to ensure everything will work
4. `terraform apply -parallelism=1`

> [!NOTE]
> This will replace each VM one at a time without any OS or application level health checking before moving onto the next VM so you may experience some downtime with your Allocations.
>
> I plan on adding more intelligent rolling replacement logic at some point. 

## Variables

<!-- Include information on the variables from your pack -->
| Name  | Description   | Default |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `endpoint`| Proxmox API endpoint for the provider. Ie. https://192.168.1.200:8006 | |
| `insecure` | Skip SSL verification | true |
| `proxmox_node` | Proxmox node to deploy to | proxmox |
| `proxmox_api_user` |  Username for Proxmox API auth | root@pam |
|`proxmox_api_password`| Password for Proxmox API auth | somepassword |
| `instance_count`| Number of nomad client instances to create | 3 |
|`cores` | Number of CPU cores for the VMs | 3 |
| `sockets` | Number of CPU sockets for the VM| 3 |
| `vm_id` | Identifier of the source VM template. Set to same ID you used when building the template with my [Packer template](https://github.com/awanaut/proxmox-nomad-packer-template). Unfortunately, having an ID is required and I couldn't find an easy way to dynamically retrieve this. Maybe i'll Look into it later. | 9999 |
| `vm_name` | Name of the VM to create. Will append a number to the end of the name for each VM created | prod-nomad-client |


