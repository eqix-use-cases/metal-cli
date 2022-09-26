# metal-cli
Examples on how to use different methods to deploy infrastructure on Equinix Metal

## Table of Contents
- [Pre-requirement](#pre-requirements)
- [Authentication](#authentication)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Pre-requirements

↥ [back to top](#table-of-contents)

- [Terraform](https://www.terraform.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads)
- [Virtualbox](https://www.virtualbox.org/)
- [Equinix Metal](https://console.equinix.com/)
- [Cloudflare](https://www.cloudflare.com/en-gb/)

## Authentication

↥ [back to top](#table-of-contents)

- Equinix

via [environmental variables](https://registry.terraform.io/providers/equinix/equinix/latest/docs#example-usage)

```bash
export METAL_AUTH_TOKEN=<TOKEN>
export EQUINIX_API_CLIENTID=<CLIENT_ID>
export EQUINIX_API_CLIENTSECRET=<CLIENT_SECRET>
```

metal cli tool authentication

```yaml
---
organization-id: <organizatio-id>
project-id: <project-id>
token: <api-token>
```

managing [cloudflare zones](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)

```
export CLOUDFLARE_EMAIL=
export CLOUDFLARE_API_TOKEN=
```

populate all variables in `bootstrap/env.sh-example` for Equinix and Cloudflare and `config/metal.yaml-example` for the Metal CLI authentication

## Usage

↥ [back to top](#table-of-contents)

This 


```bash
git clone git@github.com:equinix-metal-use-cases/metal-cli.git
cd metal-cli
```

start the Vagrant box
```bash
vagrant up --provider virtualbox
vagrant ssh
cd /vagrant 
```

## Curl example

```bash
curl -X POST \
-H "Content-Type: application/json" \
-H "X-Auth-Token: <TOKEN>" \
"https://api.equinix.com/metal/v1/projects/<PROJECT_ID>/devices" \
-d '{
    "facility": "da11",
    "plan": "c3.small.x86",
    "operating_system": "ubuntu_18_04"
}'
```
