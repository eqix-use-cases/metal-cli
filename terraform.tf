terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.10"
    }
  }
}
