#!/usr/bin/env bash

which curl wget unzip jq &>/dev/null || {
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install --no-install-recommends -y curl wget git ansible
}

# check arch
if [[ "`uname -m`" =~ "arm" ]]; then
    ARCH=arm
elif [[ "`uname -m`" == "aarch64" ]]; then
    ARCH=arm64
else
    ARCH=amd64
fi

# check the platform
if [[ "`uname`" == 'Linux' ]]; then
   PLATFORM='linux'
elif [[ "`uname`" == 'FreeBSD' ]]; then
   PLATFORM='freebsd'
fi

# download the metal-cli
wget -q -O /usr/local/bin/metal https://github.com/equinix/metal-cli/releases/download/v0.7.1/metal-${PLATFORM}-${ARCH}
chmod +x /usr/local/bin/metal

# copy cli configuration to skil - metal init
mkdir -p /home/vagrant/.config/equinix/
cp /vagrant/config/metal.yaml /home/vagrant/.config/equinix/metal.yaml