terraform {
  required_version = ">= 1.10"

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 1.5"
    }
  }
}

provider "ovh" {
  endpoint = var.ovh_endpoint
}
