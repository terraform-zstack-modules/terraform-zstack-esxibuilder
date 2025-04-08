#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}


# 应用配置变量
variable "image_name" {
  description = "Name for the esxi_builder image"
  type        = string
  default     = "esxi_builder_by_terraform"
}

variable "image_url" {
  description = "URL to download the image from"
  type        = string
  default     = "http://minio.zstack.io:9000/packer/redis-by-packer-image-compressed.qcow2"
}

variable "backup_storage_name" {
  description = "Name of the backup storage to use"
  type        = string
  default     = "bs"
}

variable "instance_name" {
  description = "Name for the esxi_builder instance"
  type        = string
  default     = "esxi_builder"
}

variable "l3_network_name" {
  description = "Name of the L3 network to use"
  type        = string
  default     = "test"
}

variable "instance_offering_name" {
  description = "Name of the instance offering to use"
  type        = string
  default     = "min"
}

variable "ssh_user" {
  description = "SSH username for remote access"
  type        = string
  default     = "zstack"
}

variable "ssh_password" {
  description = "SSH password for remote access"
  type        = string
  default     = "ZStack@123"
  sensitive   = true
}

variable "never_stop" {
  description = "Whether the instance should never be stopped automatically"
  type        = bool
  default     = true
}

# ESXi ISO 构建器所需的额外变量
variable "esxi_root_password" {
  description = "Root password for the ESXi installation"
  type        = string
  sensitive   = true
  default     = "ZStack@123"
}

variable "esxi_iso_url" {
  description = "URL to download the ESXi ISO from"
  type        = string
  default     = "http://192.168.200.100/mirror/iso/vmware/VMware_iso/VMware-VMvisor-Installer-6.5.0.update01-5969303.x86_64.iso"
}

variable "esxi_iso_filename" {
  description = "ESXi ISO文件名"
  type        = string
  default     = "VMware-VMvisor-Installer-6.5.0.update01-5969303.x86_64.iso"
}
