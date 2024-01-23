#!/bin/bash

if [ $(id -u) -ne 0 ]
then
   echo "This script should be executed as root"
   exit 0
fi

# Installing pip 
apt -y install python3-pip

# Installing Ansible
python3 -m pip install ansible
