#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

# Get mininet
git clone https://github.com/mininet/mininet

# Install mininet
mininet/util/install.sh

# Additionals
apt-get update
apt-get -y install python3-rangehttpserver
apt-get clean
