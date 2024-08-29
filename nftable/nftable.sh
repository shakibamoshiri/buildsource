#!/bin/bash

set -x

### more 
# https://dev.to/isabelcmdcosta/installing-nftables-from-sources-ondebian--4ic
# https://packages.debian.org/source/stable/nftables
# https://salsa.debian.org/pkg-netfilter-team/pkg-nftables
# https://salsa.debian.org/pkg-netfilter-team/pkg-nftables/-/blob/master/INSTALL?ref_type=heads

# apt-get update -y
# apt-get install -y aptitude

apt-get update -y
apt-get upgrade -y
apt-get install -y build-essential
apt-get install -y autoconf  asciidoc-base automake bison dh-python docbook-xsl flex libeditreadline-dev libgmp-dev libjansson-dev libmnl-dev libnftnl-dev libtool libxtables-dev python3-all
apt-get install -y libreadline-dev
apt-get install -y git

# could not resolve
# debhelper-compat 

### lib
git clone git://git.netfilter.org/libmnl
cd libmnl
sh autogen.sh
./configure
make
make install
cd ../

### lib
git clone git://git.netfilter.org/libnftnl
cd libnftnl
sh autogen.sh
./configure
make
make install
cd ../

### tool
git clone git://git.netfilter.org/nftables
cd nftables
sh autogen.sh
./configure --with-json --disable-man-doc
make
make install


### note
# nft -v
# nftables v0.9.8 (E.D.S.)
# 
# /usr/local/sbin/nft -v
# /usr/local/sbin/nft: /lib/x86_64-linux-gnu/libnftables.so.1: no version information available (required by /usr/local/sbin/nft)
# /usr/local/sbin/nft: /lib/x86_64-linux-gnu/libnftables.so.1: no version information available (required by /usr/local/sbin/nft)
# /usr/local/sbin/nft: /lib/x86_64-linux-gnu/libnftables.so.1: no version information available (required by /usr/local/sbin/nft)
# nftables v1.1.0 (Commodore Bullmoose)

### 
ldconfig

### remove old version 
### save the nftables.service file for later
cp /lib/systemd/system/nftables.service .
# apt purge -y nftable
apt autoremove -y
apt autoclean -y
apt clean  -y

### reboot and recheck
echo you can reboot your machine
# reboot

