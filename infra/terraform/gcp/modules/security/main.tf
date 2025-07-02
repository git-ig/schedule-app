resource "google_compute_firewall" "allow_ssh_to_bastion" {
  name    = "allow-ssh-to-bastion"
  network = var.network_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion"]
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = var.network_name
  allow {
    protocol = "all"
  }
  source_ranges = [
    var.public_subnet_cidr,
    var.private_subnet_cidr
  ]
}
