#!/bin/bash

if [ $(id -u) -ne 0 ]
then
   echo "This script should be executed as root"
   exit 0
fi

apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
