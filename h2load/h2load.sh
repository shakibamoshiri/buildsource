#!/bin/bash

set -ex

apt-get install -y g++ clang make binutils autoconf automake \
  autotools-dev libtool pkg-config \
  zlib1g-dev libssl-dev libxml2-dev libev-dev \
  libevent-dev libjansson-dev \
  libc-ares-dev libjemalloc-dev libsystemd-dev \
  ruby-dev bison libelf-dev

### code
# https://github.com/nghttp2/nghttp2#building-from-git
# git clone https://github.com/nghttp2/nghttp2.git
# cd nghttp2

### build
# git submodule update --init
# autoreconf -i
# automake
# autoconf
# ./configure
# make

wget -c https://github.com/nghttp2/nghttp2/releases/download/v1.70.0/nghttp2-1.70.0.tar.gz
tar xzf nghttp2-1.70.0.tar.gz
cd nghttp2-1.70.0
./configure
make
