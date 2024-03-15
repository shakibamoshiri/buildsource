#!/bin/bash

git clone https://github.com/ambrop72/badvpn.git
cd badvpn
mkdir build
cd build

### deps
apt-get install -y libnspr4 libnspr4-dev
apt-get install -y libnss3 libnss3-dev libnss3-tools


### build and install
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
make install
