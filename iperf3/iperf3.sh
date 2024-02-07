#!/bin/bash

set -ex

apt-get update -y
apt-get install -y build-essential

### download 
git clone https://github.com/esnet/iperf.git
cd iperf

### build
./configure
make
make install

apt-get install -y iperf3
