#!/bin/bash

set -ex

### download 
# wget https://humdi.net/vnstat/vnstat-latest.tar.gz
wget https://github.com/vergoh/vnstat/releases/download/v2.12/vnstat-2.12.tar.gz
tar zxvf vnstat-2.12.tar.gz
cd vnstat-2.12

### install libs
apt-get install -y libgd-dev
apt-get install -y libsqlite3-dev

### build
./configure --prefix=/usr --sysconfdir=/etc && make

### check
ls -la

