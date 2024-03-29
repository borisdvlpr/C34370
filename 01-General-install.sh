#!/bin/sh

# Check for root
[ $(id -u) -ne 0 ] && echo "Script must be executed with sudo" && exit

# Stop/disable some irrelevant services
if [ -s Files/disablelist ] ; then
  for p in $(cat Files/disablelist) ; do
    systemctl stop ${p}
    systemctl mask ${p}
  done
fi

# Miscellaneous other packages
apt-get -y install build-essential wireshark conntrack conntrackd xterm curl net-tools ssh gcc-12

# Add user to sudoers file
# grep -q -e "^user" /etc/sudoers || /usr/bin/echo -e "user\tALL = NOPASSWD: ALL" >> /etc/sudoers 

# Cleanup apt-get
apt-get clean

# Fix Grub
sed -i 's/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=menu/g' /etc/default/grub
sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=2/g' /etc/default/grub
update-grub
