output "bastion_public_ip" {
  description = "The public IP address of the bastion host."
  value       = module.compute.bastion_public_ip
}

output "frontend_private_ip" {
  description = "The private IP address of the frontend instance."
  value       = module.compute.frontend_private_ip
}

output "backend_private_ip" {
  description = "The private IP address of the backend instance."
  value       = module.compute.backend_private_ip
}

output "database_private_ip" {
  description = "The private IP address of the database instance."
  value       = module.compute.database_private_ip
}

output "monitoring_private_ip" {
  description = "The private IP address of the monitoring instance."
  value       = module.compute.monitoring_private_ip
}

output "ansible_inventory" {
  description = "Ansible inventory file content."
  value = templatefile("${path.module}/inventory.tpl", {
    bastion_public_ip     = module.compute.bastion_public_ip
    frontend_private_ip   = module.compute.frontend_private_ip
    backend_private_ip    = module.compute.backend_private_ip
    database_private_ip   = module.compute.database_private_ip
    monitoring_private_ip = module.compute.monitoring_private_ip
    ssh_user              = var.ssh_user
  })
  sensitive = true
}
