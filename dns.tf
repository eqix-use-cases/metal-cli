module "dns" {
	source = "git::github.com/andrewpopa/terraform-cloudflare-dns"
	zone_id = var.zone_id
	name = "terraform"
	value = equinix_metal_device.this.access_public_ipv4
	type = "A"
	ttl = "3600"
}