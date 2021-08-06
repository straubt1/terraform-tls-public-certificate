module "tls" {
  source = "../"

  dns_challenge_provider = "azure"
  # Need to set the following ENV variables:
  # AZURE_TENANT_ID - Tenant ID. 
  # AZURE_SUBSCRIPTION_ID - Subscription ID.
  # AZURE_CLIENT_ID - Client ID.
  # AZURE_CLIENT_SECRET - Client secret.
  # AZURE_RESOURCE_GROUP - Resource group containing the DNS zone.

  domain   = "tfe.rocks"
  hostname = "test.tfe.rocks"
}

resource "local_file" "ca" {
  filename = "./keys/ca.cert"
  content  = module.tls.ca.pem
}

resource "local_file" "ca-key" {
  filename = "./keys/ca.key"
  content  = module.tls.ca.key
}

resource "local_file" "cert" {
  filename = "./keys/certificate.cert"
  content  = module.tls.cert.pem
}

resource "local_file" "cert-key" {
  filename = "./keys/certificate.key"
  content  = module.tls.cert.key
}

resource "local_file" "cert-fullchain" {
  filename = "./keys/cert-fullchain.cert"
  content  = module.tls.cert.full_chain
}
