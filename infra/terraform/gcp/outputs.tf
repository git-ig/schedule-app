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
  value = <<-EOT
    [bastion]
    bastion ansible_host=${module.compute.bastion_public_ip}

    [frontend]
    frontend ansible_host=${module.compute.frontend_private_ip}

    [backend]
    backend ansible_host=${module.compute.backend_private_ip}

    [database]
    database ansible_host=${module.compute.database_private_ip}

    [monitoring]
    monitoring ansible_host=${module.compute.monitoring_private_ip}

    [all:vars]
    ansible_user=${var.ssh_user}
    ansible_ssh_private_key_file=~/.ssh/id_rsa
    ansible_ssh_common_args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

    [private_instances:children]
    frontend
    backend
    database
    monitoring

    [private_instances:vars]
    ansible_ssh_common_args="-o ProxyCommand='ssh -W %h:%p -q ${var.ssh_user}@${module.compute.bastion_public_ip}' -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
  EOT
  sensitive = true
}
