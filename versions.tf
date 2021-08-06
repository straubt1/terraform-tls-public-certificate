terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = ">= 2.5.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 0.13"
}
