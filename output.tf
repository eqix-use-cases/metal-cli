output "public_ip" {
  value = equinix_metal_device.this.access_public_ipv4
}

output "hostname" {
  value = equinix_metal_device.this.hostname
}

output "facilities" {
  value = equinix_metal_device.this.facilities
}

output "fqdn" {
  value = module.dns.hostname
}