#!/bin/bash

if [ $(id -u) -eq 0 ]
then
   echo "This script should be executed as regular user"
   exit 0
fi

# Installing pip 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
python3 get-pip.py --user 
# Installing Ansible 
python3 -m pip install --user ansible 
