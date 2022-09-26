# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "apopa/focal64"
  config.vm.hostname = "api-example"
  config.vm.provision "shell", path: "bootstrap/pkg.sh"
  config.vm.provision "shell", path: "bootstrap/env.sh", privileged: false
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/andrewpopa/bash-provisioning/main/terraform/latest.sh"
end
