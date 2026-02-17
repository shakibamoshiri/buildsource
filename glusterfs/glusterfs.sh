#!/bin/bash

set -euTC

# https://docs.gluster.org/en/main/Developer-guide/Building-GlusterFS/#configuring-for-building

### update list
apt-get update -y

### install dependencies
apt-get install -y make automake autoconf libtool flex bison \
  pkg-config libssl-dev libxml2-dev python-dev libaio-dev \
  libibverbs-dev librdmacm-dev libreadline-dev liblvm2-dev \
  libglib2.0-dev liburcu-dev libcmocka-dev libsqlite3-dev \
  libacl1-dev liburing-dev google-perftools

### close the repository
git clone https://github.com/gluster/glusterfs.git || true

cd glusterfs

### build version 11.1
git checkout release-11

### build
./autogen.sh
./configure
make

