#!/bin/bash

set -ex

### download 
git clone https://github.com/esnet/iperf.git
cd iperf

### build
./configure
make
make install
