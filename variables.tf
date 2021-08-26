variable "ca_email" {
  description = "(Optional) Email to register with the Certificate Authority, defaults to <domain>@domainsbyproxy.com"
  default     = null
}

variable "prod_environment" {
  description = "(optional) If true, use the ACME production URL, default to true"
  default     = true
  type        = bool
}

variable "dns_challenge_provider" {
  description = ""
}

variable "domain" {
  description = "The domain you wish to use, this will be subdomained. `example.com`"
}

variable "hostname" {
  description = "The full hostname that will be used. `tfe.example.com`."
}

variable "subject_alternative_names" {
  description = "Additional Sans Entries."
  default     = []
}
