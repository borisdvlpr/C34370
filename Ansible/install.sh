#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
