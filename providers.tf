locals {
  acme_prod_server_url  = "https://acme-staging-v02.api.letsencrypt.org/directory"
  acme_stage_server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

provider "acme" {
  server_url = var.prod_environment ? local.acme_prod_server_url : local.acme_stage_server_url
}
