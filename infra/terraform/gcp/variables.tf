variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
}

variable "zone" {
  description = "The GCP zone to deploy resources in."
  type        = string
}

variable "vm_image" {
  description = "The OS image for all VMs."
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
}

variable "ssh_user" {
  description = "The username for SSH access."
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the public SSH key."
  type        = string
}
