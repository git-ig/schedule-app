terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  backend "gcs" {
    bucket = var.bucket_name
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "network" {
  source       = "./modules/network"
  project_id   = var.project_id
  region       = var.region
}

module "security" {
  source = "./modules/security"
  project_id = var.project_id
  network_name = module.network.network_name
  public_subnet_cidr = module.network.public_subnet_cidr
  private_subnet_cidr = module.network.private_subnet_cidr
}

module "compute" {
  source                = "./modules/compute"
  project_id            = var.project_id
  zone                  = var.zone
  public_subnet_name    = module.network.public_subnet_name
  private_subnet_name   = module.network.private_subnet_name
  network_name          = module.network.network_name
  vm_image              = var.vm_image
  ssh_user              = var.ssh_user
  ssh_public_key_path   = var.ssh_public_key_path
}
