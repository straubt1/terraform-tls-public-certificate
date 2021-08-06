output "ca" {
  value = {
    pem = acme_certificate.tls.issuer_pem
    key = acme_registration.tls.account_key_pem
  }
}

output "cert" {
  value = {
    pem        = acme_certificate.tls.certificate_pem
    key        = acme_certificate.tls.private_key_pem
    full_chain = join("\n", [acme_certificate.tls.certificate_pem, acme_certificate.tls.issuer_pem])
  }
}
