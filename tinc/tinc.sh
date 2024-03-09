#!/bin/bash

set -euTCo pipefail


declare -r build_dir=build

### install deps
apt install -y meson ninja-build pkg-config build-essential libssl-dev libncurses-dev libreadline-dev zlib1g-dev liblzo2-dev liblz4-dev texinfo diffutils procps socat netcat-openbsd

### clone
git clone https://github.com/gsliepen/tinc.git
cd tinc

### configure 
meson configure

### setup build dir
meson setup $build_dir

### compile
meson compile -C $build_dir

### test
# meson test -C $build_dir

### install 
meson install -C $build_dir

### etc 
mkdir -p /usr/local/etc/tinc/
mkdir -p /var/local/run

