resource "random_pet" "this" {
  length = 3
}

module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

resource "equinix_metal_device" "this" {
  hostname            = random_pet.this.id
  plan                = "c3.small.x86"
  facilities          = ["am6"]
  operating_system    = "ubuntu_20_04"
  billing_cycle       = "hourly"
  project_id          = var.project_id
  tags                = ["tam-compute"]
}

resource "null_resource" "silent" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = equinix_metal_device.this.access_public_ipv4
    private_key = file(module.key.private_key_filename)
  }

  provisioner "remote-exec" {
    inline = [<<EOF
      sudo apt update

      EOF
    ]
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${equinix_metal_device.this.access_public_ipv4}', --private-key ${module.key.private_key_filename} ./ansible/nginx.yml"
  }
}