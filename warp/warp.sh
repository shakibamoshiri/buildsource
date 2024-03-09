#!/bin/bash

set -ex

###
### link
### https://pkg.cloudflareclient.com/
###

### enable wireguard kernel log
# modprobe wireguard 
# echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control


# Add cloudflare gpg key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# Add this repo to your apt repositories
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# Install
apt-get -o Acquire::ForceIPv4=true update -y
apt-get -o Acquire::ForceIPv4=true install -y cloudflare-warp

### make an account
warp-cli register

### set warp
warp-cli set-mode warp

### exclude all
warp-cli add-excluded-route 0.0.0.0/0

### show settings
warp-cli settings

### set license
# warp-cli set-license <license>
