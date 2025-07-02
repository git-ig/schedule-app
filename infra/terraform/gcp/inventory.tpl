[bastion]
bastion ansible_host=${bastion_public_ip}

[frontend]
frontend ansible_host=${frontend_private_ip}

[backend]
backend ansible_host=${backend_private_ip}

[database]
database ansible_host=${database_private_ip}

[monitoring]
monitoring ansible_host=${monitoring_private_ip}

[all:vars]
ansible_user=${ssh_user}
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

[private_instances:children]
frontend
backend
database
monitoring

[private_instances:vars]
ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q ${ssh_user}@${bastion_public_ip}" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
