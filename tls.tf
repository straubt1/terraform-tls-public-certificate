resource "tls_private_key" "acme" {
  algorithm = "RSA"
}

resource "acme_registration" "tls" {
  account_key_pem = tls_private_key.acme.private_key_pem
  email_address   = var.ca_email == null ? format("%s@domainsbyproxy.com", var.domain) : var.ca_email
}

resource "acme_certificate" "tls" {
  account_key_pem           = acme_registration.tls.account_key_pem
  common_name               = var.hostname
  subject_alternative_names = var.subject_alternative_names
  # min_days_remaining        = 1
  dns_challenge {
    provider = var.dns_challenge_provider
  }
}
