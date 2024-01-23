#!/bin/sh

# Check for root
if [ $(id -u) -ne 0 ]
then
   echo "This script should be executed as root"
   exit 0
fi

apt-get -y install openvswitch-common openvswitch-switch openvswitch-switch-dpdk openvswitch-doc python3-openvswitch
