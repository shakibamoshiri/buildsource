#!/bin/bash

set -ex

### install
apt-get update -y
apt-get install -y build-essential
apt-get install -y vnstat

### download 
# wget https://humdi.net/vnstat/vnstat-latest.tar.gz
wget https://github.com/vergoh/vnstat/releases/download/v2.12/vnstat-2.12.tar.gz
tar zxvf vnstat-2.12.tar.gz
cd vnstat-2.12

### install libs
apt-get install -y libgd-dev
apt-get install -y libsqlite3-dev

### build
./configure --prefix=/usr --sysconfdir=/etc
make
make install

### check
systemctl restart vnstat
